class Api::V1::CustomerSubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.where(customer_id: params[:customer_id])
    render json: CustomerSubscriptionsSerializer.new(subscriptions), status: 201
  end
end