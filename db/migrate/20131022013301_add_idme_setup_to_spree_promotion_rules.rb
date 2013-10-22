class AddIdmeSetupToSpreePromotionRules < ActiveRecord::Migration
  def change
    add_column :spree_promotion_rules, :idme_verify_button,  :text
    add_column :spree_promotion_rules, :idme_client_id,      :string
    add_column :spree_promotion_rules, :idme_client_secret,  :string
    add_column :spree_promotion_rules, :idme_redirect_uri,   :string
    add_column :spree_promotion_rules, :idme_sandbox,        :boolean
    add_column :spree_promotion_rules, :idme_military,       :boolean
    add_column :spree_promotion_rules, :idme_responder,      :boolean
    add_column :spree_promotion_rules, :idme_student,        :boolean
  end
end
