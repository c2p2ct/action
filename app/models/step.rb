class Step < ActiveRecord::Base
  include Searchable

  #searchable do 
  #  text :planstep
  #end

  belongs_to :plan

 	# validates_presence_of :planstep
	# validates_presence_of :plan_id

	# Table name: events
	#
	#  id           :integer(11)     not null, primary key
	#  title        :string(255)
	#  date         :datetime
	#  end_date     :datetime
	#  summary      :text
	#  content      :text
	#  created_at   :datetime
	#  updated_at   :datetime
	
	# # Convert to iCalendar
	# def to_ics
	#   event = Icalendar::Event.new
	#   event.start = self.date.strftime("%Y%m%dT%H%M%S")
	#   event.end = self.end_date.strftime("%Y%m%dT%H%M%S")
	#   event.summary = self.title
	#   event.description = self.summary
	#   event.location = 'Here!'
	#   event.klass = "PUBLIC"
	#   event.created = self.created_at
	#   event.last_modified = self.updated_at
	#   event.uid = event.url = "#{PUBLIC_URL}events/#{self.id}"
	#   event.add_comment("Comment for step of plan")
	#   event
	# end

  def as_indexed_json(options={})
    as_json(only: [:id, :planstep])
  end
      
# Convert to iCalendar
	def to_ics
	  event = Icalendar::Event.new
	  event.start = Date.today
	  event.end = Date.today
	  event.summary = self.planstep
	  event.description = self.planstep
	  event.location = 'Here'
	  event.klass = "PUBLIC"
	  # event.created = self.created_at
	  # event.last_modified = self.updated_at
	  # event.uid = event.url = "#{PUBLIC_URL}events/#{self.plan_id}"
	  event.add_comment("Hardcoded comment")
	  event
	end
end

Step.import
