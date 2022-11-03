require 'rails_helper'

describe "Customer Tea Subscription API" do
  it 'Can return all of a customers tea subscriptions' do
    mike = Customer.create!(first_name: 'Mike', last_name: 'Koul', email: 'mike@gmail.com', address: '123 Main Street')
    bob = Customer.create!(first_name: 'Bob', last_name: 'Smith', email: 'bob@gmail.com', address: '727 Main Street')
    green_tea = Tea.create!(title: 'Green Tea', description: 'Japanese oolong green tea leaves', temperature: '175 F', brew_time: '3 minutes')
    jasmine_tea = Tea.create!(title: 'Jasmine Tea', description: 'Japanese jasmine tea leaves', temperature: '175 F', brew_time: '3 minutes')
    mike_green_tea_sub = Subscription.create!(title: 'Green tea subscription', price: '$9.99', status: 0, frequency: 'Once a month', tea_id: green_tea.id, customer_id: mike.id)
    mike_jasmine_tea_sub = Subscription.create!(title: 'Jasmine tea subscription', price: '$12.99', status: 1, frequency: 'Once a month', tea_id: jasmine_tea.id, customer_id: mike.id)
    bob_green_tea_sub = Subscription.create!(title: 'Green tea subscription', price: '$9.99', status: 0, frequency: 'Once a month', tea_id: green_tea.id, customer_id: bob.id)

    get api_v1_customer_subscriptions_path(mike)

    response_body = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(response_body).to be_a(Hash)
    expect(response_body).to have_key(:data)
    expect(response_body[:data]).to be_a(Array)
    expect(response_body[:data].count).to eq(2)
    expect(response_body[:data][0]).to have_key(:id)
    expect(response_body[:data][0][:id]).to be_a(String)
    expect(response_body[:data][0]).to have_key(:type)
    expect(response_body[:data][0][:type]).to be_a(String)
    expect(response_body[:data][0]).to have_key(:attributes)
    expect(response_body[:data][0][:attributes]).to be_a(Hash)
    expect(response_body[:data][0][:attributes]).to have_key(:title)
    expect(response_body[:data][0][:attributes][:title]).to be_a(String)
    expect(response_body[:data][0][:attributes]).to have_key(:price)
    expect(response_body[:data][0][:attributes][:price]).to be_a(String)
    expect(response_body[:data][0][:attributes]).to have_key(:status)
    expect(response_body[:data][0][:attributes][:status]).to eq("active")
    expect(response_body[:data][0][:attributes]).to have_key(:frequency)
    expect(response_body[:data][0][:attributes][:frequency]).to be_a(String)
    expect(response_body[:data][0][:attributes]).to have_key(:tea_id)
    expect(response_body[:data][0][:attributes][:tea_id]).to be_a(Integer)
    expect(response_body[:data][0][:attributes]).to have_key(:customer_id)
    expect(response_body[:data][0][:attributes][:customer_id]).to be_a(Integer)

    expect(response_body[:data][1][:attributes][:status]).to eq("cancelled")
  end
end