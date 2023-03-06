require 'date'

class UsersController < ApplicationController
  def dashboard
    skip_authorization
    @users = policy_scope(User)
    # @user = current_user

    # For clock in/clock out
    @today = Date.today
    @timesheet_new = Timesheet.new
    @timesheet = current_user.timesheets.last

    @task = Task.new

    # To display "Tasks Done" donut pie chart
    @tasks_done = Task.where(status: "done").count
    @all_tasks = Task.all.count
    @tasks_status = Task.group(:status).count

    # To display "Team overtime" bar chart
    overtime

    # To display greeting message
    check_attendance
  end

  def show
    @user = User.find(params[:id])
    @timesheets = @user.timesheets
    skip_authorization
    @goals = @user.goals
    # authorize @user

    # To display employee donut chart
    @tasks = @user.tasks
    @my_tasks_done = @tasks.where(status: "done").count
    @all_my_tasks = @tasks.count
    @my_tasks_status = @tasks.group(:status).count

    # To display employee overtime chart
    individual_overtime
  end

  private

  def check_attendance
    # 1. Get all the users that it is not manager
    employees = User.where(is_manager: false)
    today = Date.today
    @absent_employee = []
    # 2. Check the time_in record for today
    employees.each do |employee|
      ordered_timesheets = employee.timesheets.order(:time_in)
      if employee.timesheets != [] && ordered_timesheets.last.time_in.to_date != today
        @absent_employee << employee.name
      end
    end
    # 3. If all of them is true, show message "All of your team members are here today!"
    # 4. Else show message "#{user.name} is not yet here."
    if @absent_employee.empty?
      @greeting_message = "All of your team members are here today!"
    else
      @greeting_message = "#{@absent_employee.join(', ')} is not here yet."
    end
  end

  def overtime
    # (time_out - time_in) will get results in seconds
    # 9 hours = 32400 seconds (9 hours because deduct lunch time)
    # overtime is true if (time_out - time_in) > 32400

    # Pseudo code:
    # Get all employees
    all_employees = User.where(is_manager: false)
    # Get all employees' timesheets
    @employees_hash = {}
    all_employees.each do |employee|
      # Get one employee timesheets
      employee_timesheets = employee.timesheets
      employee_overtime = 0
      # Iterate all the timesheets
      employee_timesheets.each do |timesheet|
        if timesheet.time_out
          # Calculate each timesheet's (time_out - time_in)
          differences = timesheet.time_out - timesheet.time_in
          # If results > 32400 add to overtime
          employee_overtime += differences - 32_400 if differences > 32_400
          # Convert seconds to hours
          employee_overtime_hrs = employee_overtime / 3600
          @employees_hash[employee.name] = employee_overtime_hrs.round(2)
        end
      end
    end
    @employees_hash
  end

  def individual_overtime
    individual_overtime = 0
    @individual_hash = {}
    user = User.find(params[:id])
    user.timesheets.each do |timesheet|
      if timesheet.time_out
        differences = timesheet.time_out - timesheet.time_in
        individual_overtime += differences - 32_400 if differences > 32_400
        individual_overtime_hrs = individual_overtime / 3600
        @individual_hash[user.name] = individual_overtime_hrs.round(2)
      end
    end
    @individual_hash
  end
end
