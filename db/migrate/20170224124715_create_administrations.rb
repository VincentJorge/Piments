class CreateAdministrations < ActiveRecord::Migration[5.0]
  def change
    create_table :administrations do |t|
      t.string :login
      t.string :password
      t.string :email
      t.string :role
      t.string :fname
      t.string :lname

      t.timestamps
    end
  end
end
