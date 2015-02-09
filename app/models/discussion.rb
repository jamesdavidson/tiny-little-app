class Discussion < ActiveRecord::Base
  has_many :updates

  ['topic','location','beverage'].each do |thing|
    class_eval "def current_#{thing}
        result = nil
        self.updates.where(updatable_type: '#{thing.capitalize}').each do |u|
          if u.retraction?
            result = nil
          else
            result = u.updatable
          end
        end
        result
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
