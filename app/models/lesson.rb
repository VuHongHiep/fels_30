class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :quizzes, dependent: :destroy
  accepts_nested_attributes_for :quizzes
end
