class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchases = current_user.purchases
  end

  def new
    @purchase = Purchase.new()
    @purchase.product_id = params[:product_id].to_i
  end


  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user_id = current_user.id
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to :purchases, notice: 'Purchase was successfull.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def purchase_history

  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def purchase_params
    params.require(:purchase).permit(:user_id, :product_id, :amount)
  end
end
