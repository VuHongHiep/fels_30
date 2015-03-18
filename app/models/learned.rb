class Learned < ActiveRecord::Base
  belongs_to :user
  belongs_to :word

  scope :word_learned_ids, -> user_id {Learned.select("word_id").where(user_id: user_id)}
end
