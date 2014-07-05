class Step < ActiveRecord::Base
		belongs_to :plan
     	validates_presence_of :sequence
     	validates_presence_of :planstep
		validates_presence_of :plan_id
end
