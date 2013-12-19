class AddIdmeSetupToSpreePromotionRules < ActiveRecord::Migration
  def change
    add_column :spree_promotion_rules, :spree_idme_setting_id,       :integer, :default => 1
    add_column :spree_promotion_rules, :active_promotion_affinities, :text,    :default => []
    add_index  :spree_promotion_rules, :spree_idme_setting_id
  end
end
