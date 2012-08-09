class AnalysesController < ApplicationController
  
  respond_to :json, :html
  
  def index
    if request.xhr?
      @analyses = Analysis.assigned.paginate :page => params[:page], :per_page => page_size
      render_partial :analyses 
    end
  end
  
  def show
    @analysis = Analysis.find(params[:id])      
  end
  
  def new
    date = Time.now;
    @analysis = Analysis.new(:due_date => date + 1.week)
    render :edit
  end
  
  def create
    @analysis = Analysis.create(params[:analysis])
    if @analysis.save
      redirect_to analyses_path
    else
      render :edit
    end
  end
  
  def edit
    @analysis = Analysis.find(params[:id])
  end
  
  def update
    @analysis = Analysis.find(params[:id])
    if @analysis.update_attributes(params[:analysis])
      redirect_to_index
    else
      render :edit
    end
  end
  
  def destroy
    Analysis.destroy(params[:id])
    redirect_to :back
  end
  
end