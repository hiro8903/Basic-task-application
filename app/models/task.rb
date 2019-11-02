class Task < ApplicationRecord
  belongs_to :user
  
  def user
    User.find(self.user_id)
  end
end
