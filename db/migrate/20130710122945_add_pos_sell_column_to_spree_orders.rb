class AddPosSellColumnToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :pos_sell, :boolean, default: false
  end
end
