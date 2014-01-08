class Spree::Admin::ShowStockController < Spree::Admin::BaseController
  def index
    @products = Spree::Product.all.includes(variants: :option_values)
  end
end