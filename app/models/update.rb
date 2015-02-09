class Update < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :updatable, :polymorphic => :true
end
