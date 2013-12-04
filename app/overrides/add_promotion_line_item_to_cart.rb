Deface::Override.new(:virtual_path => 'spree/orders/edit',
                     :insert_after => "[data-hook = 'cart_items']",
                     :text =>
                       "<% if @order.adjustments.exists? %>
                          <%= render 'spree/orders/adjustments' %>
                        <% end %>",
                     :name => "idme_promotion_status"
                    )
