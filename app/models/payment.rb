class Payment < ActiveRecord::Base
  belongs_to :curriculum_student

  def amount_formatted
    return sprintf("%.2f", self.amount)
  end
end
