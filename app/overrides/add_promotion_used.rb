Deface::Override.new(:virtual_path => 'spree/admin/promotions/edit',
                     :name => "Add orders used list",
                     :insert_after => "#promotion-filters",
                     :partial => "spree/admin/promotions/orders",
                     :disabled => false)
