class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.string :name
      t.text :categories, array: true, default: []
      t.text :references, array: true, default: []

      t.timestamps
    end
  end
end
