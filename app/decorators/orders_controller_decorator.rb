Spree::OrdersController.class_eval do

    def update
      @affinity_groups = AffinityGroup.all
      @settings        = SpreeIdmeSetting.first
      @order           = current_order

      if @order.update_attributes(params[:order])
        @order.line_items = @order.line_items.select { |li| li.quantity > 0 }
        fire_event('spree.order.contents_changed')
        respond_with(@order) { |format| format.html { redirect_to cart_path } }
      else
        respond_with(@order)
      end
    end

    def edit
      @affinity_groups = AffinityGroup.all
      @settings        = SpreeIdmeSetting.first
      @order           = current_order(true)
    end

end
