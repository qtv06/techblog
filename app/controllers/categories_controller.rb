class CategoriesController < ApplicationController
  def show
    @category = Category.find_by id: params[:id]
    @posts = @category.posts.references(:users)
  end
end
