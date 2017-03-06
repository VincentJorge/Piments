class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :role
      t.string :nbrPiments
      t.integer :promotion

      t.timestamps
    end
  end
end