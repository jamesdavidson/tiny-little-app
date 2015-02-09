module NullRecord
  extend ActiveSupport::Concern
  class_methods do
    def null_record
      self.find(0)
    end
  end
end
