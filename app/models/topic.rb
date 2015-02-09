class Topic < ActiveRecord::Base
  has_many :updates, :as => :updatable
end
