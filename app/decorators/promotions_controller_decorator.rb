Spree::Admin::PromotionsController.class_eval do

    def update

      unless params[:idme_promotion_rules_id].nil?
        rules = IdmePromotionRule.find(params[:idme_promotion_rules_id])
        rules.activate_affinity_groups!(params[:active_promotion_affinities])
      end

      super
    end

    def edit
      @settings        = SpreeIdmeSetting.first
      @affinity_groups = AffinitySubgroup.all

      @settings.update_affiliations_check

      super
    end

end
