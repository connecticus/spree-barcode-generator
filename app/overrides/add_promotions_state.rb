Deface::Override.new(:virtual_path => 'spree/admin/promotions/index',
                     :name => "Add promotions state label",
                     :insert_after => "erb[loud]:contains('Spree.t(:expiration)')",
                     :text => "<th><%= Spree.t(:status) %></th>",
                     :disabled => false)
Deface::Override.new(:virtual_path => 'spree/admin/promotions/index',
                     :name => "Add promotions state text",
                     :insert_after => "erb[loud]:contains('promotion.expires_at')",
                     :partial => "spree/admin/promotions/status_text",
                     :disabled => false)
