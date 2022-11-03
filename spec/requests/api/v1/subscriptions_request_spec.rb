require 'rails_helper'

describe "Subscription API" do
  it 'Can create a subscription for a customer and a specific tea' do
    mike = Customer.create!(first_name: 'Mike', last_name: 'Koul', email: 'mike@gmail.com', address: '123 Main Street')
    green_tea = Tea.create!(title: 'Green Tea', description: 'Japanese oolong green tea leaves', temperature: '175 F', brew_time: '3 minutes')  
    create_subscription_body = {
      title: 'Green tea subscription',
      price: '$9.99',
      status: 'active',
      frequency: 'Once a month',
      tea_id: green_tea.id, 
      customer_id: mike.id 
    }

    post api_v1_subscriptions_path(create_subscription_body)

    response_body = JSON.parse(response.body, symbolize_names: true)[:data]
    
    expect(response).to be_successful
    expect(response_body).to be_a(Hash)
    expect(response_body).to have_key(:id)
    expect(response_body[:id]).to be_a(String)
    expect(response_body).to have_key(:type)
    expect(response_body[:type]).to be_a(String)
    expect(response_body).to have_key(:attributes)
    expect(response_body[:attributes]).to be_a(Hash)
    expect(response_body[:attributes]).to have_key(:title)
    expect(response_body[:attributes][:title]).to be_a(String)
    expect(response_body[:attributes]).to have_key(:price)
    expect(response_body[:attributes][:price]).to be_a(String)
    expect(response_body[:attributes]).to have_key(:status)
    expect(response_body[:attributes][:status]).to be_a(String)
    expect(response_body[:attributes]).to have_key(:frequency)
    expect(response_body[:attributes][:frequency]).to be_a(String)
    expect(response_body[:attributes]).to have_key(:tea_id)
    expect(response_body[:attributes][:tea_id]).to be_a(Integer)
    expect(response_body[:attributes]).to have_key(:customer_id)
    expect(response_body[:attributes][:customer_id]).to be_a(Integer)
  end
end