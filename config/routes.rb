Spree::Core::Engine.routes.append do
  namespace :admin do
    scope :barcode do
      get "/print/:id" => "barcode#print"
      get "/code/:id" => "barcode#code"
    end

    get 'print_coupon/:coupon_code' => 'print_coupon#print'
    
    scope :pos do
      get "/new" => "pos#new"
      get "/show/:number" => "pos#show"
      post "/apply_coupon/:number" => "pos#apply_coupon"
      post "/show/:number" => "pos#show"
      get "/find/:number" => "pos#find"
      get "/add/:number/:item" => "pos#add"
      get "/remove/:number/:item" => "pos#remove"
      get "/print/:number" => "pos#print"
      get "/inventory/:number" => "pos#inventory"

      scope :refund do
        get 'select_order' => 'refund#select_order'
        post 'select_items' => 'refund#select_items'
        post 'create_refund' => 'refund#create_refund'
      end
    end

    get "/pos" , :to => "pos#new"
    get "/stock_products", to: "show_stock#index"
  end
end

