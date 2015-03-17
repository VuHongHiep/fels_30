class Word < ActiveRecord::Base
  belongs_to :category
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions
end
