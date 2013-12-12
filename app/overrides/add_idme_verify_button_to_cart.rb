Deface::Override.new(:virtual_path => 'spree/orders/edit',
                     :insert_before => "[data-hook = 'cart_buttons']",
                     :text =>
                       "<% if @settings.idme_sandbox %>
                          <% idme_server_url = 'http://sandbox.id.me/oauth/authorize' %>
                        <% else %>
                          <% idme_server_url = 'https://www.id.me/oauth/authorize' %>
                        <% end %>

                        <% @affinity_groups.each do |group| %>
                          <% if group.enabled %>
                            <% if @settings.idme_modal %>
                              <a class='login-trigger-<%= group.scope %>' href='#'>
                              <img alt='Verify your <%= group.scope %> affiliation with ID.me' src='<%= group.button %>' /></a>

                              <script type='text/javascript' charset='utf-8'>
                                $(document).ready(function() {
                                  $('.login-trigger-<%= group.scope %>').on('click', function() {
                                    var top   = ($(document).height() - 780) / 4;
                                    var left  = ($(document).width() - 750) / 2;

                                    window.open('<%= idme_server_url %>?client_id=<%= @settings.idme_client_id_string %>&redirect_uri=<%= @settings.redirect_uri %>&response_type=code&scope=<%= group.scope %>&display=popup', '', 'scrollbars=yes,menubar=no,status=no,location=no,toolbar=no,width=750,height=780,top=' + top + ',left=' + left);
                                  });
                                });
                              </script>

                            <% else %>
                              <a href='<%= idme_server_url %>?client_id=<%= @settings.idme_client_id_string %>&redirect_uri=<%= @settings.redirect_uri %>&response_type=code&scope=<%= group.scope %>'>
                              <img alt='Verify your <%= group.scope %> affiliation with ID.me' src='<%= group.button %>' /></a>
                            <% end %>
                          <% end %>
                        <% end %>
                        <br />
                        <br />
                        <%= link_to 'Log out of ID.me', 'https://www.sandbox.id.me/users/sign-out', :method => :delete %>
                        <br />
                        <br />
                        <br />",
                     :name => "idme_verify_button"
                    )
