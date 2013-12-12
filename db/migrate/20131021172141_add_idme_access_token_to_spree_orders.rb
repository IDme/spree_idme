class AddIdmeAccessTokenToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :idme_access_token, :string
    add_column :spree_orders, :idme_scope,        :string
  end
end
