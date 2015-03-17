class LessonsController < ApplicationController

  def create
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build params.permit
    @lesson.user_id = current_user.id
    @lesson.result = 0
    @lesson.numberOfQuestion = 3
    @words = @lesson.category.words.sample @lesson.numberOfQuestion
    @words.each do |word|
      @lesson.quizzes.build word_id: word.id, question_id: 0
    end
    if @lesson.save
      redirect_to edit_lesson_path @lesson
    else
      flash.now[:danger] = "error"
    end
  end

  def edit
    @lesson = Lesson.find params[:id]
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  def update
    @lesson = Lesson.find params[:id]
    if @lesson.update_attributes lesson_params
      redirect_to lesson_path @lesson
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit :id, quizzes_attributes: [:id, :question_id]
  end

end
