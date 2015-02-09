class Discussion < ActiveRecord::Base
  has_many :updates
  has_many :topics, :through => :updates, :source => :updatable, :source_type => 'Topic'
  has_many :locations, :through => :updates, :source => :updatable, :source_type => 'Location'
  has_many :beverages, :through => :updates, :source => :updatable, :source_type => 'Beverage'

  def current_topic
    self.topics.order('created_at ASC').first || Topic.null_record
  end

  def current_location
    self.locations.order('created_at ASC').first || Location.null_record
  end

  def current_beverage
    self.beverages.order('created_at ASC').first || Beverage.null_record
  end

  def title
    "#{self.current_topic.name} is being discussed " \
    "at #{self.current_location.name} " \
    "whilst drinking #{self.current_beverage.name}."
  end
end
