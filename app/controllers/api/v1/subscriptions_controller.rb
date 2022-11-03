class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(sub_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { description: "Error: Subscription Not Created" }, status: 404
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    if subscription.update(sub_params)
      render json: SubscriptionSerializer.new(Subscription.find(params[:id])), status: 201
    else
      render json: { description: "Error: Subscription Not Updated" }, status: 404
    end
  end

  private
  def sub_params
    params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
end 
