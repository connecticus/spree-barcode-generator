require "spree/core"
module SpreePos
  class Configuration < Spree::Preferences::Configuration
      preference :pos_shipping_method, :string, default: nil
      preference :pos_ship_address, :string, default: nil
      preference :pos_bill_address, :string, default: nil
      preference :pos_printing, :string , :default => "/admin/invoice/number/receipt"
  end
end
