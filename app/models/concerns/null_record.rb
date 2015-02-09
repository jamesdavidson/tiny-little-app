module NullRecord
  extend ActiveSupport::Concern
  class_methods do
    def null_record
      Topic.find(0)
    end
  end
end
