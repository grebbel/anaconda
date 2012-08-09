class AssaysController < ApplicationController
  
  def index
    @assays = Assay.order(:name).paginate(:page => params[:page], :per_page => page_size)
  end
  
  def new
    @assay = Assay.new
    render :edit
  end
  
  def create
    @assay = Assay.new(params[:assay])
    if @assay.save
      redirect_to_index
    else
      render :edit
    end
  end
  
  def edit
    @assay = Assay.find(params[:id])
  end
  
  def update
    @assay = Assay.find(params[:id])
    if @assay.update_attributes(params[:assay])
      update_analyses
      redirect_to_index
    else
      render :edit
    end
  end
  
  def destroy
    Assay.destroy(params[:id])
    redirect_to_index
  end
  
  private
  
  def update_analyses
    Analysis.where(:assay_id => @assay).each do |analysis|
      analysis.ct = analysis.calculate_ct
      analysis.save
    end    
  end
  
end