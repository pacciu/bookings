class AddNickToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :nick, :string
  end
end
