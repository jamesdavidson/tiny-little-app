class DropRetractionFromUpdates < ActiveRecord::Migration
  def up
    Update.where(retraction: true).each do |u|
      u.updatable_id = 0 # the null record
      u.save
    end
    remove_column :updates, :retraction
  end
  def down
    add_column :updates, :retraction, :boolean, :default => :false
    Update.where(updatable_id: 0).each do |u|
      # find the last model
      previously = Update.where(updatable_type: u.updatable_type)
                         .where.not(updatable_id: 0)
                         .where('created_at < ?', u.created_at)
                         .order(:created_at)
                         .last
                         .id
      u.updatable_id = previously
      u.retraction = true
      u.save
    end
  end
end
