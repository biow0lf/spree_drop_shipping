class PrefixTableNames < ActiveRecord::Migration
  def change
    rename_table :suppliers, :spree_suppliers
    rename_table :supplier_products, :spree_supplier_products
    rename_table :drop_ship_orders, :spree_drop_ship_orders
    rename_table :drop_ship_line_items, :spree_drop_ship_line_items
  end
end
