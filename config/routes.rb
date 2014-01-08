Spree::Core::Engine.routes.append do
  namespace :admin do
    scope :barcode do
      get "/print/:id" => "barcode#print"
      get "/code/:id" => "barcode#code"
    end
    
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
    end
    get "/pos" , :to => "pos#new"
    get "/stock_products", to: "show_stock#index", as: 'pos_show_stock'
  end
end

