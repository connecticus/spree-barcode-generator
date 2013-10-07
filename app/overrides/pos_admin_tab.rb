Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
                     :name => "pos_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => " <%= tab( :pos , :url => spree.admin_pos_path, icon: 'icon-shopping-cart') %>",
                     :disabled => false)
