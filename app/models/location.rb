class Location < ActiveRecord::Base
  include NullRecord
  has_many :updates, :as => :updatable
end
