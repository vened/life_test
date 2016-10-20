require 'rails_helper'

describe "Articles API" do
  it 'sends a list of messages' do
    FactoryGirl.create_list(:article, 20)

    get '/api/v0/articles'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.length).to eq(20)
  end
end