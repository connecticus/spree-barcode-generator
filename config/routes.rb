Spree::Core::Engine.routes.append do
  namespace :admin do
    scope :barcode do
      get "/print/:id" => "barcode#print"
      get "/code/:id" => "barcode#code"
    end
  end
end

