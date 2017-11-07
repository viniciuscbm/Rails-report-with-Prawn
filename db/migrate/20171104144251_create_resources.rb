class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.datetime :initial
      t.datetime :deadline

      t.timestamps
    end
  end
end
