class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    #creates people table
    create_table :people do |t|
      t.string :name, null: false
      t.integer :house_id, null: false

      t.timestamps
    end

    #adds house_id to people table
    add_index :people, :house_id
  end
end
