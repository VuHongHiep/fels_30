class WordsController < ApplicationController
  def index
    @categories = Category.all.map{|c| [c.descript, c.id]}
    @categories = @categories.insert(0, ['All', 'all'])

    if params[:category_id] && params[:category_id] != 'all'
      @category = Category.find params[:category_id]
      @words = filter_by params[:learned], @category.words
    else
      @words = Word.all
      @words = filter_by params[:learned], @words
    end
  end

  def edit
    @word = Word.find params[:id]
  end

  def update
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      redirect_to words_path
    else
      render 'edit'
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    flash[:success] = "Word deleted"
    redirect_to words_path
  end

  private

  def word_params
    params.require(:word).permit :id, questions_attributes: [:id, :answer, :check]
  end

  def filter_by state, words
    @learned_word_ids = Learned.word_learned_ids current_user.id
    if state == 'learned'
      words.learned_words @learned_word_ids
    elsif state == 'not learned'
      words.not_learned_words @learned_word_ids
    else
      words
    end
  end
end
