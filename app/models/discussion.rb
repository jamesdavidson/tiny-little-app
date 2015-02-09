class Discussion < ActiveRecord::Base
  has_many :updates

  # define the current_topic, current_location and current_beverage methods
  ['topic','location','beverage'].each do |thing|
    class_eval "def current_#{thing}
        self.updates.where(updatable_type: '#{thing.capitalize}').reduce(nil) do |result,u|
          if u.retraction?
            result = nil
          else
            result = u.updatable
          end
        end
      end"
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
