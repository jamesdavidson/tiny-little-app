class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.timestamps null: false

      # a discussion is (basically) a list of updates
      t.references :discussion

      # each update is an assertion by default but may be a retraction
      t.boolean :retraction, default: false

      # a polymorphic association to topics, locations and beverages
      t.integer :updatable_id
      t.string  :updatable_type
    end
    add_index :updates, :updatable_id
  end
end
