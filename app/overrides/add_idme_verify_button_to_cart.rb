Deface::Override.new(:virtual_path => 'spree/orders/edit',
                     :insert_before => "[data-hook = 'cart_buttons']",
                     :text => 
                       "<% if IdmePromotionRule.last.idme_sandbox %>
                          <% idme_server_url = 'https://www.sandbox.id.me/oauth/authorize' %>
                        <% else %>
                          <% idme_server_url = 'https://www.id.me/oauth/authorize' %>
                        <% end %>

                        <% if IdmePromotionRule.where(:idme_affinity => 'Military').count > 0 %>
                          <% enable_military = true %>
                        <% end %>

                        <% if IdmePromotionRule.where(:idme_affinity => 'Student').count > 0 %>
                          <% enable_student = true %>
                        <% end %>

                        <% if IdmePromotionRule.where(:idme_affinity => 'Responder').count > 0 %>
                          <% enable_responder = true %>
                        <% end %>

                        <% if enable_military %>
                          <a href='<%= idme_server_url %>?client_id=<%= SpreeIdmeSetting.first.idme_client_id_string %>&redirect_uri=<%= SpreeIdmeSetting.first.redirect_uri %>&response_type=code&scope=military'>
                          <img alt='Verify your military affiliation with ID.me' src='<%= SpreeIdmeSetting.first.military_button %>' /></a>
                        <% end %>

                        <% if enable_student %>
                          <a href='<%= idme_server_url %>?client_id=<%= SpreeIdmeSetting.first.idme_client_id_string %>&redirect_uri=<%= SpreeIdmeSetting.first.redirect_uri %>&response_type=code&scope=student'>
                          <img alt='Verify your student affiliation with ID.me' src='<%= SpreeIdmeSetting.first.student_button %>' /></a>
                        <% end %>

                        <% if enable_responder %>
                          <a href='<%= idme_server_url %>?client_id=<%= SpreeIdmeSetting.first.idme_client_id_string %>&redirect_uri=<%= SpreeIdmeSetting.first.redirect_uri %>&response_type=code&scope=responder'>
                          <img alt='Verify your first responder affiliation with ID.me' src='<%= SpreeIdmeSetting.first.responder_button %>' /></a>
                        <% end %>
                        <br />
                       <br />",
                     :name => "idme_verify_button"
                    )
