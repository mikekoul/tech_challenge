class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(sub_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { description: "Error: Subscription Not Created" }, status: 404
    end
  end

  private
  def sub_params
    params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
end 
