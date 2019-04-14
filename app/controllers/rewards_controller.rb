class RewardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchases = current_user.purchases
  end
end
