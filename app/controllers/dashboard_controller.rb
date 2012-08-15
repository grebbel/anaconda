class DashboardController < ApplicationController
  
  def index
    if request.xhr?
      case params[:partial] 
      when 'tasks'
        @tasks = Task.uncompleted.assigned_to(current_user)
        if params[:tags]
          @tasks = @tasks.tagged params[:tags].split(/,/) 
        else
          @tasks = @tasks.by_request_date
        end
        @tasks = @tasks.paginate(:page => params[:page], :per_page => page_size)
        render_partial :tasks 
      when 'tags'
        @tags = Tag.for_tasks(current_user)
        render_partial :tags
      end
    end
  end
  
end