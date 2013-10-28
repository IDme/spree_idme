class AddIdmeSetupToSpreePromotionRules < ActiveRecord::Migration
  def change
    add_column :spree_promotion_rules, :spree_idme_setting_id,  :integer, :default => 1
    add_column :spree_promotion_rules, :idme_affinity, :string
    add_column :spree_promotion_rules, :idme_sandbox,  :boolean
  end
end
