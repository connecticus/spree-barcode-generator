Spree::Variant.class_eval do
  def barcode
    str = self.ean if self.respond_to?(:ean)
    return str unless str.to_s.empty?
    self.sku
  end
end