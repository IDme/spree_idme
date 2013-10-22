class AddIdmeAccessTokenToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :idme_access_token, :string
  end
end
