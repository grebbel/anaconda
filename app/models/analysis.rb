class Analysis < ActiveRecord::Base
  belongs_to :request
  belongs_to :target
  belongs_to :assay
  has_many :amplifications, :dependent => :destroy
  
  attr_accessible :request_id, :target_id, :assay_id
  accepts_nested_attributes_for :amplifications
  
  validates :request_id, :presence => true
  validates :target_id, :presence => true
  
  scope :assigned, where('assay_id IS NOT NULL')
  scope :without_amplifications, joins('LEFT JOIN amplifications ON analyses.id = amplifications.analysis_id').where('analysis_id IS NULL')
  scope :positive, where(:status => :positive)
  scope :negative, where(:status => :negative)
  scope :indeterminate, where(:status => :indeterminate)
  scope :undecided, where(:status => nil)
  
  def actual_treshold
    assay_target = AssayTarget.where(:assay_id => assay.id, :target_id => target.id).first
    treshold = assay_target.treshold if assay_target
    treshold
  end
  
  def actual_ct
    if ct
      ct
    else
      calculate_ct
    end
  end
  
  def calculate_ct(treshold = nil)
    treshold ||= self.actual_treshold
    return nil unless treshold
    
    below_treshold = nil
    above_treshold = nil    
    previous = nil
    amplifications.reverse_each do |amplification, index|
      if amplification.delta_rn < treshold
        below_treshold = amplification
        above_treshold = previous
        break
      end
      previous = amplification
    end
    
    calculated_ct = nil
    if below_treshold && above_treshold
      tresholdA = Point.new(below_treshold.cycle, treshold);
      tresholdB = Point.new(above_treshold.cycle, treshold);
      drnA = Point.new(below_treshold.cycle, below_treshold.delta_rn);
      drnB = Point.new(above_treshold.cycle, above_treshold.delta_rn);
      intersection = find_intersection(tresholdA, tresholdB, drnA, drnB);      
      calculated_ct = intersection.x if intersection
    end
    calculated_ct
  end
  
  private
  
  def find_intersection(p1, p2, p3, p4)
		#double xD1, yD1, xD2, yD2, xD3, yD3
		#double dot, deg, len1, len2
		#double segmentLen1, segmentLen2
		#double ua, ub, div

		# calculate differences
		xD1 = p2.x - p1.x
		xD2 = p4.x - p3.x
		yD1 = p2.y - p1.y
		yD2 = p4.y - p3.y
		xD3 = p1.x - p3.x
		yD3 = p1.y - p3.y

		# calculate the lengths of the two lines
		len1 = Math::sqrt(xD1 * xD1 + yD1 * yD1)
		len2 = Math::sqrt(xD2 * xD2 + yD2 * yD2)

		# calculate angle between the two lines.
		dot = (xD1 * xD2 + yD1 * yD2) # dot product
		deg = dot / (len1 * len2)

		# if abs(angle)==1 then the lines are parallell,
		# so no intersection is possible
		#return nil if (Math::abs(deg) == 1)
		return nil if (deg.abs == 1)

		# find intersection Pt between two lines
		pt = Point.new(0, 0)
		div = yD2 * xD1 - xD2 * yD1
		ua = (xD2 * yD3 - yD2 * xD3) / div
		ub = (xD1 * yD3 - yD1 * xD3) / div
		pt.x = p1.x + ua * xD1
		pt.y = p1.y + ua * yD1

		# calculate the combined length of the two segments
		# between Pt-p1 and Pt-p2
		xD1 = pt.x - p1.x
		xD2 = pt.x - p2.x
		yD1 = pt.y - p1.y
		yD2 = pt.y - p2.y
		segmentLen1 = Math::sqrt(xD1 * xD1 + yD1 * yD1) + Math::sqrt(xD2 * xD2 + yD2 * yD2)

		# calculate the combined length of the two segments
		# between Pt-p3 and Pt-p4
		xD1 = pt.x - p3.x
		xD2 = pt.x - p4.x
		yD1 = pt.y - p3.y
		yD2 = pt.y - p4.y
		segmentLen2 = Math::sqrt(xD1 * xD1 + yD1 * yD1) + Math::sqrt(xD2 * xD2 + yD2 * yD2)

		# if the lengths of both sets of segments are the same as
		# the lenghts of the two lines the point is actually
		# on the line segment.

		# if the point isn't on the line, return null
		return nil if ((len1 - segmentLen1).abs > 0.01 || (len2 - segmentLen2).abs > 0.01) 

		# return the valid intersection
		return pt
  end
  
end
