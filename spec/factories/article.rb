FactoryGirl.define do
  factory :article, class: Article do
    title { Faker::Lorem.words }
    description { Faker::Lorem.paragraph }
    link { Faker::Internet.url }
  end
  factory :article_1, class: Article do
    title 'news'
    description 'текст новости news_text'
    link 'http://lenta.ru'
  end
end