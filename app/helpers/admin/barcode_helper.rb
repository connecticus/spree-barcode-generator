module Admin::BarcodeHelper

  def product_barcode_url
    "/admin/barcode/code/#{@product.id}"
  end
end
