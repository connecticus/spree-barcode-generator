# encoding: utf-8
require 'barby'
require 'prawn'
require 'prawn/measurement_extensions'
require 'barby/barcode/code_128'
require 'barby/barcode/ean_13'
require 'barby/outputter/png_outputter'
class Spree::Admin::BarcodeController < Spree::Admin::BaseController
  before_filter :load 
  layout :false
  
  # moved to pdf as html has uncontrollable margins
  def print
    pdf = Prawn::Document.new( :page_size => [ 54.mm , 25.mm ] , :margin => 2.mm )
    pdf.font 'app/assets/stylesheets/store/OpenSans-Light.ttf'

    option_value = " #{@variant.option_values.first.presentation}" if @variant.option_values.first
    name_show = @variant.product.name
    price = @variant.display_price.to_s

    pdf.float do
      pdf.draw_text name_show, :at => [2,52], :size => 9
      pdf.draw_text @variant.barcode, :at => [2,32], :size => 10
    end
    pdf.draw_text option_value, :at => [0,43], :size => 9
    pdf.draw_text price, :at => [90,32], :size => 10

    if barcode = get_barcode
      pdf.image( StringIO.new( barcode.to_png(:xdim => 5)) , :width => 50.mm,
            :height => 10.mm , :at => [ 0 , 10.mm])
    end
    send_data pdf.render , :type => "application/pdf" , :filename => "#{@variant.barcode}.pdf"
  end
    
  
  private
   def get_barcode
    code = nil
    code = @variant.ean if @variant.respond_to?(:ean)
    code = @variant.sku if (code == nil) or (code == "")
    return nil if (code == nil) or (code == "")
    if code.length == 12
      return ::Barby::EAN13.new( code )
    else
      return ::Barby::Code128B.new( code  )
    end
  end
  
  def load
    @variant = Spree::Variant.find params[:id]
  end

end

