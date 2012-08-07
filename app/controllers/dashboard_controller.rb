class DashboardController < ApplicationController
  
  def index
    if request.xhr?
      @current_tasks = current_tasks.by_request_date.paginate(:page => params[:page], :per_page => page_size)
      render_partial :tasks
    end
  end
  
  private
  
  def current_tasks
    Task.uncompleted.assigned_to(current_user).by_request_date
  end
  
end