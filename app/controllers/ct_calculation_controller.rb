class CtCalculationController < ApplicationController
  
  respond_to :json
  
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
  
end