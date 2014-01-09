Spree::OrdersController.class_eval do

    def update
      @affinity_groups = AffinityGroup.all
      @settings        = SpreeIdmeSetting.first
      @order           = current_order

      if @order.update_attributes(params[:order])
        @order.line_items = @order.line_items.select { |li| li.quantity > 0 }
        fire_event('spree.order.contents_changed')
        respond_with(@order) do |format|
          format.html do
            if params.has_key?(:checkout)
              @order.next_transition.run_callbacks
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

    def edit
      @affinity_groups = AffinityGroup.all
      @settings        = SpreeIdmeSetting.first
      @order           = current_order(true)
      associate_user
    end

end
