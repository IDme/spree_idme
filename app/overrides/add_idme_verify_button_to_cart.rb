Deface::Override.new(:virtual_path => 'spree/orders/edit',
                     :insert_before => "[data-hook = 'cart_buttons']",
                     :text => "<%= IdmePromotionRule.last.idme_verify_button.html_safe %><br /><br />",
                     :name => "idme_verify_button"
                    )
