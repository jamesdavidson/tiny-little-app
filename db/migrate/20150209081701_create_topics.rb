class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :name
      t.text :url

      t.timestamps null: false
    end
  end
end
