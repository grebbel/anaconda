class RequestsController < ApplicationController
  
  def index    
    @requests = Request.paginate(:page => params[:page], :per_page => page_size)
    render_partial :requests if request.xhr?
  end
  
  def show
    @request = Request.find(params[:id])
    @tasks = @request.tasks
    @analyses = @request.analyses.assigned    
    render_partial :tasks if request.xhr?
    render_partial :analyses if request.xhr?
  end
  
  def new
    @request = Request.new
    @request.due_date = Time.now + 7.days
  end
  
  def create
    @request = Request.new(params[:request])
    if @request.valid?
      @request.start
      @request.assign_uncompleted_tasks_to current_user
      redirect_to_index
    else 
      render :new
    end
  end
  
  def destroy
    Request.destroy(params[:id])
    redirect_to_index
  end
  
end