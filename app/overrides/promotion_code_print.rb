Deface::Override.new(:virtual_path => 'spree/admin/promotions/_form',
                     :name => "Add print button",
                     :replace => "erb[loud]:contains('f.field_container :code')",
                     :closing_selector => "erb[silent]:contains('end')",
                     :partial => "spree/admin/print_coupon/barcode_coupon_link",
                     :disabled => false)