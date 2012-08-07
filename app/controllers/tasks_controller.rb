class TasksController < ApplicationController
  
  before_filter :bust_cache, :except => :index
  
  def index
    @tasks = Task.uncompleted.by_request_date.paginate(:page => params[:page], :per_page => page_size)
    render_partial :tasks if request.xhr?
  end
  
  def show
    @task = Task.find(params[:id])
    assign_assays_to_analyses unless @task.completed
  end
  
  def update
    @task = Task.find(params[:id])
    raise ScriptError, t('errors.task_completed') if @task.completed
    raise ScriptError, t('errors.task_not_assigned', :user => current_user.display_name) if @task.assignee != current_user
    self.send "handle_#{@task.description}_task"
  end
  
  def assign_to_user
    @task = Task.find(params[:id])
    user = User.find(params[:userId]) if params[:userId].present?
    @task.assign_to user
    render :layout => nil
  end
  
  private
  
  def assign_assays_to_analyses
    @task.request.analyses.each do |analysis|
      unless analysis.assay
        assays = analysis.target.assays
        analysis.assay = assays.first if assays.count == 1
      end
    end    
  end
  
  def handle_review_request_task
    req = @task.request
    req.update_attributes(params[:request])
    if (params[:accept])
      if req.valid? :review_accept
        req.accept
        go_to_next_task :review
      else
        render :show
      end
    else
      req.reject
      go_to_next_task :review
    end    
  end
  
  def go_to_next_task(state)
    tasks = Task.uncompleted.assigned_to(current_user).with_request_in_state(state)
    unless tasks.empty?
      summary = t("task_descriptions.#{@task.description}.summary")
      flash[:notice] = t("tasks.completed", :task => summary, :request => @task.request.description)
      redirect_to tasks.first
    else
      flash[:notice] = t('tasks.no_uncompleted')
      redirect_to root_path
    end
    
  end
  
end