class RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin, only: [:reward_reports, :get_rewards_distribution]

  def index
    @purchases = current_user.purchases
  end

  def reward_reports

  end

  def get_rewards_distribution
    stat = Product.joins(:purchases)
        .select("products.name, sum(purchases.reward_points)")
        .group('products.name').to_a
    render json: stat
  end
end
