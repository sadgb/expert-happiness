class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :surname
      t.integer :age
      t.integer :gender
      t.string :password_hash
      t.string :city
      t.text :about

      t.timestamps
    end
  end
end
