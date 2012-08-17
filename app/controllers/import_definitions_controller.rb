class ImportDefinitionsController < ApplicationController
  
  def index
    @import_definitions = ImportDefinition.all
  end
  
  def new
    @import_definition = ImportDefinition.new
    render :edit
  end
  
  def create
    @import_definition =  ImportDefinition.new(params[:import_definition])
    if @import_definition.save
      redirect_to_index
    else
      render :edit
    end
  end
  
  def edit
    @import_definition = ImportDefinition.find(params[:id])
  end
  
  def update
    @import_definition = ImportDefinition.find(params[:id])
    if @import_definition.update_attributes(params[:import_definition])
      redirect_to_index
    else
      render :edit
    end
  end
  
  def destroy
    ImportDefinition.destroy(params[:id])
    redirect_to :back
  end
  
end