class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.references :word, index: true
      t.references :question, index: true
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
