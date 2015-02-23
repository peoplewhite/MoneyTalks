class AddCustomerToMoney < ActiveRecord::Migration
  def change
  	add_column :money, :customer_id, :integer
  end
end
