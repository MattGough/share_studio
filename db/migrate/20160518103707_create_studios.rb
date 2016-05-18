class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string :name
      t.integer :rating

      t.timestamps null: false
    end
  end
end
