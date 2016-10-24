class OrdersController < ApplicationController
  def create

  end

  private
  def order_params
    params.require(:order).permit(:venue_id).merge! user: current_user
  end
end
