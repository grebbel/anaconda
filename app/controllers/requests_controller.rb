class RequestsController < ApplicationController
  
  def index    
    if request.xhr?
      case params[:partial]
      when 'requests'
        @requests = Request
        @requests = @requests.tagged params[:tags].split(/,/) if params[:tags]
        @requests = @requests.paginate(:page => params[:page], :per_page => page_size)
        render_partial :requests
      when 'tags'
        @tags = Tag.for_requests
        render_partial :tags
      end
    end
  end
  
  def show
    @request = Request.find(params[:id])
    @tasks = @request.tasks
    @analyses = @request.analyses.assigned
    @analysis_set = AnalysisSet.new(@analyses)
    render_partial :tasks if request.xhr?
    render_partial :analyses if request.xhr?
  end
  
  def new
    if params[:generate]
      @request = generate_request
    else
      @request = Request.new
      @request.due_date = Time.now + 7.days
    end
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
  
  private
  
  def generate_request
    generator = RequestGenerator.new
    generator.count = 1
    requests = generator.generate_requests :disable_start => true
    requests[0]
  end
  
end