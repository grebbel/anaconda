class TagsController < ApplicationController
  
  def index
    @tags = Tag.paginate(:page => params[:page])
  end
  
  def show
    @tag = Tag.find(params[:id])
  end
  
  def new
    @tag = Tag.new
    render :edit
  end
  
  def create
    @tag = Tag.create(params[:tag])
    if @tag.save
      redirect_to tags_path
    else
      render :edit
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(params[:tag])
      redirect_to :action => :index
    else
      render :edit
    end
  end
  
  def destroy
    Tag.destroy(params[:id])
    redirect_to :back
  end
  
end