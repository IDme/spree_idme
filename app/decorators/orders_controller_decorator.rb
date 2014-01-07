Spree::OrdersController.class_eval do

    def edit
      @affinity_groups = AffinityGroup.all
      @settings        = SpreeIdmeSetting.first
      @order           = current_order(true) || Order.new
      associate_user
    end

    def update
      @affinity_groups = AffinityGroup.all
      @settings        = SpreeIdmeSetting.first
      @order           = current_order(true)

      @order = current_order
      unless @order
        flash[:error] = Spree.t(:order_not_found)
        redirect_to root_path and return
      end

      if @order.update_attributes(order_params)
        @order.line_items = @order.line_items.select {|li| li.quantity > 0 }
        @order.ensure_updated_shipments
        return if after_update_attributes

        fire_event('spree.order.contents_changed')

        respond_with(@order) do |format|
          format.html do
            if params.has_key?(:checkout)
              @order.next_transition.run_callbacks if @order.cart?
              redirect_to checkout_state_path(@order.checkout_steps.first)
            else
              redirect_to cart_path
            end
          end
        end
      else
        respond_with(@order)
      end
    end

end
