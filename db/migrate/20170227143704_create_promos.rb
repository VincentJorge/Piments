class CreatePromos < ActiveRecord::Migration[5.0]
  def change
    create_table :promos do |t|
      t.string :name
      t.string :school
      t.integer :date
      t.integer :administrateur

      t.timestamps
    end
  end
end
