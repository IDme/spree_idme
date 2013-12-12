Spree::OrdersController.class_eval do

    def edit
      @affinity_groups = AffinityGroup.all
      @settings        = SpreeIdmeSetting.first
      @order           = current_order(true)
    end

end
