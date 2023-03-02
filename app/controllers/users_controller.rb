class UsersController < ApplicationController
  def dashboard
    skip_authorization
    @users = policy_scope(User)
    @user = current_user

    # to display individual users tasks:
   
    # To display "Tasks Done" donut pie chart
    @tasks_done = Task.where(status: "done").count
    @all_tasks = Task.all.count
    @tasks_status = Task.group(:status).count
    # To display "Team overtime" bar chart
    overtime
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
        # Calculate each timesheet's (time_out - time_in)
        differences = timesheet.time_out - timesheet.time_in
        # If results > 32400 add to overtime
        employee_overtime += differences - 32_400 if differences > 32_400
        # Convert seconds to hours
        employee_overtime_hrs = employee_overtime / 3600
        @employees_hash[employee.name] = employee_overtime_hrs.round(2)
      end
    end
    @employees_hash
  end

  def show
    @user = User.find(params[:id])
    @timesheets = @user.timesheets
    authorize @user
  end
end
