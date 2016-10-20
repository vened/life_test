class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  def default_serializer_options
    { root: true }
  end
end
