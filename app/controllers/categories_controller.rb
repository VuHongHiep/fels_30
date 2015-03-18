class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
  end

  def edit
    @category = Category.find params[:id]
    @word = @category.words.build
    4.times {@word.questions.build}
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit :id, words_attributes: [:id, :name, :mean], questions_attributes: [:id, :answer, :check]
  end

end
