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
    calculate_reward_points if @purchase.amount
    respond_to do |format|
      if @purchase.save
        #Add the reward points to the user profile
        current_user.profile.reward_points += @purchase.reward_points
        #Update the reward points validity
        current_user.profile.rewards_expiry_date = Date.today + @purchase.product.rewards_validity_duration.months
        current_user.profile.save
        format.html {redirect_to :rewards, notice: 'Purchase was successfull.'}
        format.json {render :show, status: :created, location: @purchase}
      else
        format.html {render :new}
        format.json {render json: @purchase.errors, status: :unprocessable_entity}
      end
    end
  end

  def purchase_history

  end

  private

  def calculate_reward_points
    #the formula for reward point is loan_amount * reward_points_factor/100
    @purchase.reward_points = @purchase.amount * (@purchase.product.reward_points_factor / 100)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def purchase_params
    params.require(:purchase).permit(:user_id, :product_id, :amount, :loan_period)
  end
end
