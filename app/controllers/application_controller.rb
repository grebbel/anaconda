class ApplicationController < ActionController::Base
  
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :handle_page_size, :only => :index
  after_filter :store_page_number, :only => :index
  #before_filter :bust_cache
  around_filter :handle_exceptions
  
  def page_size
    (session[page_size_key] || 10).to_i
  end
  
  private
  
    def render_partial(partial)
      render "#{action_name}_#{partial}", :layout => nil if params[:partial].to_s == partial.to_s
    end
    
    def handle_page_size
      if params[:page_size].present?
        session[page_size_key] = params[:page_size].to_i
        redirect_to :controller => controller_name, :action => action_name
      end
    end
  
    def redirect_to_index
      redirect_to index_with_last_page
    end
  
    def index_with_last_page(default = { :action => :index })
      session[page_number_key] || default
    end

    def store_page_number
      if params[:page].present?
        session[page_number_key] = request.url
      else
        session.delete page_number_key
      end
    end
  
    def controller_index_key
      "#{params[:controller]}-index"
    end
  
    def page_number_key
      "#{controller_index_key}-page-number"
    end

    def page_size_key
      "#{controller_index_key}-page-size"
    end
    
    def bust_cache
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
    
    def handle_exceptions
      begin
        yield
      rescue ActiveRecord::RecordNotFound
        not_found_response
      rescue ScriptError => error
        script_error_response error
      end
    end

    def not_found_response
      render :text => 'Not Found', :status => 404
    end
    
    def script_error_response(error)
      render :text => error.message, :status => 500
    end
    
end
