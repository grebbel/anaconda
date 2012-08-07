class TargetsController < ApplicationController
  
  def index
    @targets = Target.paginate :page => params[:page], :per_page => page_size
  end
  
  def show
    @target = Target.find(params[:id])
  end
  
  def new
    @target = Target.new
    render :edit
  end
  
  def create
    @target = Target.new(params[:target])
    if @target.save
      redirect_to_index
    else
      render :edit
    end      
  end
  
  def edit
    @target = Target.find(params[:id])
  end
  
  def update
    @target = Target.find(params[:id])
    if @target.update_attributes(params[:target])
      redirect_to_index
    else      
      render :edit
    end
  end
  
  def destroy
    Target.destroy(params[:id])
    redirect_to :back
  end
  
end
