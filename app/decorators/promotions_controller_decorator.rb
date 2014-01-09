Spree::Admin::PromotionsController.class_eval do

    def update

      unless params[:idme_promotion_rules_id].nil?
        rules = IdmePromotionRule.find(params[:idme_promotion_rules_id])
        rules.activate_affinity_groups!(params[:active_promotion_affinities], params[:affinity_selector])
      end

      super
    end

    def edit
      @settings        = SpreeIdmeSetting.first
      @affinity_groups = AffinityGroup.all

      if @settings.idme_client_id_string
        @settings.update_affiliations_check
      end

      super
    end

end
