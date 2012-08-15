class AnalysesController < ApplicationController
  
  respond_to :json, :html
  
  def index
    if request.xhr?
      case params[:partial]
      when 'analyses'
        @analyses = Analysis.assigned
        @analyses = @analyses.tagged params[:tags].split(/,/) if params[:tags]
        @analyses = @analyses.paginate :page => params[:page], :per_page => page_size
        render_partial :analyses 
      when 'tags'
        @tags = Tag.for_analyses
        render_partial :tags
      end
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
  
  def calculate_ct
    @ct_calculations = [ ]
    params[:calculations].each do |calculation|
      analysis = Analysis.find(calculation[:analysis_id])
      if analysis
        treshold = calculation[:treshold]
        ct = analysis.calculate_ct(treshold)
        calculation = CtCalculation.new(:analysis_id => analysis.id, :treshold => treshold, :ct => ct)
        @ct_calculations.push(calculation)
      end
    end
  end
  
  def update_results
    analyses = params[:analyses]
    analyses.each do |analysis_id, hash|
      analysis = Analysis.find(analysis_id)
      if hash[:treshold]
        analysis.treshold = hash[:treshold].to_f
        analysis.ct = analysis.calculate_ct
      end
      analysis.status = hash[:status]
      analysis.save
    end
    flash[:notice] = t('analyses.results_updated')
    redirect_to :back
  end

end