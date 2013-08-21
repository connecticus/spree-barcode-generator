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
    pdf = Prawn::Document.new( :page_size => [ 54.mm , 25.mm ] , :margin => 1.mm )
    name = @variant.name
    name += " #{@variant.option_values.first.presentation}" if @variant.option_values.first
    name_show = code
    name_show = name if code.empty?
    
    pdf.text( name_show )
    price = @variant.price
    pdf.text "#{price} €", align: :right
    if barcode = get_barcode
      pdf.image( StringIO.new( barcode.to_png(:xdim => 5)) , :width => 50.mm , 
            :height => 10.mm , :at => [ 0 , 10.mm])
    end
    send_data pdf.render , :type => "application/pdf" , :filename => "#{name_show}.pdf"
  end
    
  
  private
  # leave this in here maybe for later, not used anymore
  def code
    str = @variant.ean if @variant.respond_to?(:ean) 
    return str unless str.to_s.empty?
    @variant.sku
  end

  #get the barby barcode object from the id, or nil if something goes wrong
  def get_barcode
    return nil if code.to_s.empty?
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

