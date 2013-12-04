Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "admin_idme_settings_tab",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab :idme_settings, :icon => 'icon-th-large' %>",
                     :disabled => false
                    )
