class Spree::Admin::RefundController < Spree::Admin::BaseController
  layout 'spree/admin/layouts/refund'

  def select_order

  end

  def select_items
    @order = Spree::Order.find_by(number: params[:order_number])
    if @order
      @order.return_authorizations.select(&:can_cancel?).map(&:cancel) if @order.return_authorizations.count > 0
      @return_authorization = Spree::ReturnAuthorization.create(order: @order, reason: 'POS refund')
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
    @order = Spree::Order.find_by(number: params[:order_number])
    @return_authorization = Spree::ReturnAuthorization.find_by(number: params[:rma])
    @coupon_amount = params[:coupon_amount].try(&:to_f)

    if @coupon_amount && @coupon_amount > 0
      create_discount_coupon  @coupon_amount
      @return_authorization.reason = "POS refund. Create coupon #{@coupon.code} with the amount #{params[:coupon_amount]}"
    end

    (params[:return_quantity] || []).each { |variant_id, qty| @return_authorization.add_variant(variant_id.to_i, qty.to_i) }
    @return_authorization.receive
  end

  protected
  def create_discount_coupon(amount)
    @coupon = Spree::Promotion.create(name: "REFUND #{@order.number}",event_name: 'spree.checkout.coupon_code_added', usage_limit: 2)
    @coupon.code = "#{@return_authorization.number}NI"
    action = @coupon.actions.build(type: 'Spree::Promotion::Actions::CreateAdjustment')
    calculator = Spree::Calculator::FlatRate.create
    action.calculator = calculator
    @coupon.save!
    calculator.preferred_amount = amount
  end
end