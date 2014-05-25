class Survey < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_many :answers, :order => 'created_at', :dependent => :destroy
  has_many :results

  accepts_nested_attributes_for :answers, :allow_destroy => true
  # accepts_nested_attributes_for :answers, :reject_if => :all_blank , :allow_destroy => true

  ANSWER_TYPE = {
    :single_choice    => 1,
    :multiple_choice  => 2,
    # :single_box       => 3,
    # :multiple_box     => 4
  }

  def is_owner
    user.id == self.user_id
  end

  def is_single_choice
    self.answer_type == ANSWER_TYPE[:single_choice]
  end

  def is_multiple_choice
    self.answer_type == ANSWER_TYPE[:multiple_choice]
  end

end
