class Discussion < ActiveRecord::Base
  has_many :updates
  has_many :topics, :through => :updates, :source => :updatable, :source_type => 'Topic'
  has_many :locations, :through => :updates, :source => :updatable, :source_type => 'Location'
  has_many :beverages, :through => :updates, :source => :updatable, :source_type => 'Beverage'

  def current_topic
    result = nil
    self.updates.where(updatable_type: 'Topic').each do |u|
      if u.retraction?
        result = nil
      else
        result = u.updatable
      end
    end
    result
  end

  def current_location
    result = nil
    self.updates.where(updatable_type: 'Location').each do |u|
      if u.retraction?
        result = nil
      else
        result = u.updatable
      end
    end
    result
  end

  def current_beverage
    result = nil
    self.updates.where(updatable_type: 'Beverage').each do |u|
      if u.retraction?
        result = nil
      else
        result = u.updatable
      end
    end
    result
  end

  def title
    topic = self.current_topic.try(:name)
    location = self.current_location.try(:name)
    beverage = self.current_beverage.try(:name)
    [
      (topic || 'No set topic'), 'is being discussed',
      (location ? 'at ' + location : nil),
      (beverage ? 'whilst drinking ' + beverage : nil)
    ].compact.join(' ') + '.'
  end
end
