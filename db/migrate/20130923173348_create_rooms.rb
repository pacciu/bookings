class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :description

      t.timestamps
    end
  end
end
