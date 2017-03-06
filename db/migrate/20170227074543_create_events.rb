class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :descrip
      t.integer :numberPiments
      t.string :promotions
      t.date :dateStart
      t.date :dateEnd
      t.timestamps
    end
  end
end
