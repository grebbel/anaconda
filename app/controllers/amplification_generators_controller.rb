class AmplificationGeneratorsController < ApplicationController
  
  def new
    @amplification_generator = AmplificationGenerator.new
  end
  
  def create
    @amplification_generator = AmplificationGenerator.new(params[:amplification_generator])
    if @amplification_generator.valid?
      analyses = generate_amplifications
      unless analyses.empty?
        flash[:notice] = t('amplification_generators.create.generated', :analysis_count => analyses.count)
      else
        flash[:warning] = t('amplification_generators.create.none')
      end
    end
    redirect_to new_amplification_generator_path
  end
  
  private
  
  def generate_amplifications
    analyses = Analysis.where(:id => Analysis.assigned.without_amplifications.map { |a| a.id })
    analyses.each do |analysis|
      analysis.request.prepared if analysis.request.state.to_sym == :prepare
      amplifications = @amplification_generator.generate_amplifications
      amplifications.each_with_index do |amplification, index|
        Amplification.create(:analysis_id => analysis.id, :cycle => index + 1, :rn => amplification, :delta_rn => amplification)
      end
      analysis.ct = analysis.calculate_ct
      analysis.save
    end
    analyses.to_a
  end
  
end