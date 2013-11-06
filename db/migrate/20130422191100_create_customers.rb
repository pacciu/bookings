class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :nome
      t.string :cognome
      t.string :telefono
      t.string :email

      t.timestamps
    end
  end
end
