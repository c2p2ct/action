class Plan < ActiveRecord::Base
  include Searchable

  #searchable do 
  #  text :name, :description
  #  text :plansteps do
  #    steps.map(&:planstep).select { |s| s.present? }
  #  end
  #  integer :popularity
  #end
	
  mount_uploader :picture, PictureUploader
  has_many :steps
  has_many :comments
  accepts_nested_attributes_for :steps
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name
  validates_presence_of :description

  # def should_generate_new_friendly_id?
  #   new_record?
  # end

 #  def self.search(query)
 #  		where("name like ?", "%#{query}%") 
	# end


   def self.make_ical
      @calendar = Icalendar::Calendar.new
      event = Icalendar::Event.new
      event.start = self.event.start_datetime.strftime("%Y%m%dT%H%M%S%Z")
      event.end = self.event.end_datetime.strftime("%Y%m%dT%H%M%S%Z")
      event.summary = self.event.topic.name
      event.description = self.event.topic.description
      event.location = self.event.location
      @calendar.add event
      @calendar.publish
      file = File.new("tmp/ics_files/sample.ics", "w+")
      file.write(@calendar.to_ical)
      file.close
  end

  def as_indexed_json(options={})
    as_json(
      only: [:id, :name, :description, :popularity],
      include: [:steps]
    )
  end
end

Plan.import
