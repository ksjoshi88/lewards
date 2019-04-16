class RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin, only: [:reward_reports, :get_rewards_distribution]

  def index
    @purchases = current_user.purchases
  end

  def reward_reports

  end

  def get_rewards_distribution

    #comp_stat varible will store the comparison
    comp_stat = Product.joins(:purchases)
                    .select("products.name, sum(purchases.reward_points) as rewards, sum(purchases.amount) as amount")
                    .group('products.name').to_a
    stat = Product.joins(:purchases)
        .select("products.name, sum(purchases.reward_points)")
        .group('products.name').to_a

    render json: {rw: stat,rc: comp_stat}
  end


end
