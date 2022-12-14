class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.integer :user_id
      t.string :gender
      t.string :specialty
      t.string :hospital
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
