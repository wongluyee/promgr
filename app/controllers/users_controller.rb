require 'date'

class UsersController < ApplicationController
  def dashboard
    skip_authorization
    @users = policy_scope(User)
    @user = current_user
    @timesheet = Timesheet.new
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

  def check_attendance
    # 1. Get all the users that it is not manager
    employees = User.where(is_manager: false)
    # 2. Check the time_in record for today
    # today = DateTime.parse("31 Mar 2023 00:00:00")
    today = Date.today
    @absent_employee = []
    employees.each do |employee|
      @absent_employee << employee.name if employee.timesheets.last.time_in.to_date != today
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

  def show
    @user = User.find(params[:id])
    @timesheets = @user.timesheets
    skip_authorization
    @goals = @user.goals
    # authorize @user
    skip_authorization
  end
end
