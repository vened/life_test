module Api
  module V0
    class ArticlesController < ApplicationController

      def index
        if params[:search].present?
          @articles = Article.search_by_full_text(params[:search]).page(params[:offset]).per(params[:limit])
        else
          @articles = Article.all.page(params[:offset]).per(params[:limit])
        end

        def meta_attributes(resource, extra_meta = {})
          {
              current_page: resource.current_page,
              next_page: resource.next_page,
              prev_page: resource.prev_page, # use resource.previous_page when using will_paginate
              total_pages: resource.total_pages,
              total_count: resource.total_count
          }.merge(extra_meta)
        end

        render json: @articles, each_serializer: Api::V0::ArticleSerializer, meta: meta_attributes(@articles)
      end

      def show
        @article = Article.find(params[:id])
        render json: @article, serializer: Api::V0::ArticleSerializer
      end

    end
  end
end