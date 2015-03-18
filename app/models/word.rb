class Word < ActiveRecord::Base
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :learneds, dependent: :destroy

  accepts_nested_attributes_for :questions

  scope :learned_words, -> learned_word_ids {where(id: learned_word_ids)}
  scope :not_learned_words, -> learned_word_ids {where.not(id: learned_word_ids)}

end
