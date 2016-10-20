require 'rails_helper'

describe "Articles API" do

  before do
    FactoryGirl.create_list(:article, 20)
  end

  it 'list' do
    get '/api/v0/articles'

    expect(response).to be_success
    expect(json['data'].length).to eq(20)
  end
  it 'show' do
    article = Article.first
    get "/api/v0/articles/#{article.id}"

    expect(response).to be_success
    expect(json['data']['attributes']['title']).to eq(article.title)
  end
  it 'search title' do
    FactoryGirl.create(:article_1)
    get "/api/v0/articles?search=news"

    expect(response).to be_success
    expect(json['data'].length).to eq(1)
    expect(json['data'][0]['attributes']['title']).to eq('news')
  end
  it 'search description' do
    FactoryGirl.create(:article_1)
    get "/api/v0/articles?search=news_text"

    expect(response).to be_success
    expect(json['data'].length).to eq(1)
    expect(json['data'][0]['attributes']['description']).to eq('текст новости news_text')
  end
end