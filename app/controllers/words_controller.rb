class WordsController < ApplicationController
  def index
    @categories = Category.all
    if !params.has_key? :category_id
      params[:category_id] = 'all'
      @words = Word.all
    elsif params[:category_id] == 'all'
      @words = Word.all
    else
      @words = Category.find(params[:category_id]).words
    end
  end
end
