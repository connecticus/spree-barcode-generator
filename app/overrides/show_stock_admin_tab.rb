Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
                     :name => "show_stock_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => " <%= tab( :stock , :url => spree.admin_stock_products_path, icon: 'icon-shopping-cart') %>",
                     :disabled => false)
