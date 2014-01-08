class Spree::Admin::RefundController < Spree::Admin::BaseController
  layout 'spree/admin/layouts/refund'

  def select_order

  end

  def select_items
    @order = Spree::Order.find_by(number: params[:order_number])
    @order.return_authorizations.select(&:can_cancel?).map(&:cancel)
    @return_authorization = Spree::ReturnAuthorization.create(order: @order, reason: 'POS refund')
    if @order
      if @order.state == 'complete'
        @variants = @order.variants
      else
        flash[:error] = "This order can't be refund because is in state #{@order.state}"
        redirect_to action: :select_order
      end
    else
      flash[:error] = 'The order number is has not been found'
      redirect_to action: :select_order
    end
  end

  def create_refund
    @return_authorization = Spree::ReturnAuthorization.find_by(number: params[:rma])
    (params[:return_quantity] || []).each { |variant_id, qty| @return_authorization.add_variant(variant_id.to_i, qty.to_i) }
    @return_authorization.receive
  end

  protected
  def create_discount_coupon
    @coupon = Spree::Promotion
  end
end