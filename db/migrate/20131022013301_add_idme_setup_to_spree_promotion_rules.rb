class AddIdmeSetupToSpreePromotionRules < ActiveRecord::Migration
  def change
    add_column :spree_promotion_rules, :spree_idme_setting_id,       :integer, :default => 1
    add_column :spree_promotion_rules, :idme_military_active,        :boolean
    add_column :spree_promotion_rules, :idme_military_veteran,       :boolean
    add_column :spree_promotion_rules, :idme_military_retiree,       :boolean
    add_column :spree_promotion_rules, :idme_military_spouse,        :boolean
    add_column :spree_promotion_rules, :idme_military_family,        :boolean
    add_column :spree_promotion_rules, :idme_responder_emt,          :boolean
    add_column :spree_promotion_rules, :idme_responder_firefighter,  :boolean
    add_column :spree_promotion_rules, :idme_responder_police,       :boolean
    add_column :spree_promotion_rules, :idme_student,                :boolean
  end
end
