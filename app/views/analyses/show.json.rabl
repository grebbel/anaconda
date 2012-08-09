object @analysis
attributes :id, :status
attributes :treshold
attributes :ct
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
