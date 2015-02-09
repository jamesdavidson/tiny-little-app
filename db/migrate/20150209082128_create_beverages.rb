class CreateBeverages < ActiveRecord::Migration
  def change
    create_table :beverages do |t|
      t.text :name
      t.boolean :caffeinated
      t.boolean :alcoholic
      t.boolean :hot
      t.boolean :cold

      t.timestamps null: false
    end
  end
end
