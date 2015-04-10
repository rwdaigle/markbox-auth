class ApiController < ApplicationController

  skip_filter :verify_authenticity_token
  http_basic_authenticate_with name: ENV["APP_API_USER"], password: ENV["APP_API_PASSWORD"]
end
