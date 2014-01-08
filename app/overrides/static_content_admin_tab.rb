Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
                     :name => "admin_idme_settings_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:idme, :icon => 'icon-th-large', url: admin_idme_settings_path) %>",
                     :disabled => false
                    )
