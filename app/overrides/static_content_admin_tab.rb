Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
                     :name => "admin_idme_settings_tab",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab :idme_settings, :icon => 'icon-th-large' %>",
                     :disabled => false
                    )
