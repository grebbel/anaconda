object @analysis
attributes :actual_treshold => :treshold
attributes :actual_ct => :ct
attributes :status
child :target do
  attributes :name, :id
  node (:color) { |target| (target.color ? "##{target.color.hex}" : '#000000') }
end
child :assay do |assay|
  attributes :name
end
child :amplifications do
  attributes :cycle, :rn, :delta_rn
end
