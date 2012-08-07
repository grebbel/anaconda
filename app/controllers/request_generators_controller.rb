class RequestGeneratorsController < ApplicationController
  
  def new
     @request_generator = RequestGenerator.new
  end
  
  def create
    @request_generator = RequestGenerator.new(params[:request_generator])
    if @request_generator.valid?
      requests = generate_requests
      flash[:notice] = "Generated #{requests.count} requests"
    end
    redirect_to new_request_generator_path
  end
  
  private
  
  def generate_requests
    requests = [ ]
    @request_generator.generate_requests.each do |req|
      if @request_generator.assign_to_current_user
        req.tasks.each { |task| task.assign_to current_user }
      end
      requests << req
    end
    requests    
  end
  
end