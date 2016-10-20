module Api
  module V0
    class ArticleSerializer < ActiveModel::Serializer
      attributes :id, :title, :link, :description, :pubDate, :image
    end
  end
end

