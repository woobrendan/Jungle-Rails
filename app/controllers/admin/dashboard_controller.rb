class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["NAME"], password: ENV["PASSWORD"]
  
  def show
    @products = Product.all
    @categories = Category.all
  end
end
