module Api
  module V0
    class ArticlesController < ApplicationController

      def index
        @articles = Article.all.page(params[:offset]).per(params[:limit])
        render json: @articles
      end

      def show
        @article = Article.find(params[:id])
        render json: @article
      end

    end
  end
end