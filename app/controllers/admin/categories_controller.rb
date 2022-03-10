class Admin::CategoriesController < ApplicationController
  def show
  end

  def index
    @categories = Category.all
  end

  def create
  end
end
