class Quiz < ActiveRecord::Base
  belongs_to :word
  belongs_to :question
end
