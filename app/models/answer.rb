class Answer < ActiveRecord::Base
  belongs_to :survey
  has_many :results

  validates :survey_id, :content,  :presence => true
  
end


