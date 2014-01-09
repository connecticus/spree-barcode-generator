class Spree::Admin::ShowStockController < Spree::Admin::BaseController
  def index
    @products = Spree::Product.all.includes(variants: :option_values).select do |product|
      product.total_on_hand > 0
    end
  end
end