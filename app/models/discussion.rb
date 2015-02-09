class Discussion < ActiveRecord::Base
  has_many :updates
  has_many :topics, :through => :updates, :source => :updatable, :source_type => 'Topic'
  has_many :locations, :through => :updates, :source => :updatable, :source_type => 'Location'
  has_many :beverages, :through => :updates, :source => :updatable, :source_type => 'Beverage'
end
