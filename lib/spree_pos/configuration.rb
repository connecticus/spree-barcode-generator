require "spree/core"
module SpreePos
  class Configuration < Spree::Preferences::Configuration
      preference :pos_shipping_method, :string
      preference :pos_ship_address, :string
      preference :pos_bill_address, :string
      preference :pos_printing, :string , :default => "/admin/invoice/number/receipt"
  end
end
