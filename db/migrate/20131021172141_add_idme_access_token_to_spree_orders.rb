class AddIdmeAccessTokenToSpreeOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :idme_verified_at,   :datetime
    add_column :spree_orders, :idme_scope,         :string
    add_column :spree_orders, :idme_affiliation,   :string
    add_column :spree_orders, :idme_access_token,  :string
    add_column :spree_orders, :idme_verified,      :boolean
  end
end
