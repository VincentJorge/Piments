class CreateUserEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :user_events do |t|
      t.integer :idUser
      t.integer :idEvent

      t.timestamps
    end
  end
end
