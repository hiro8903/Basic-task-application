class Task < ApplicationRecord
  belongs_to :user
  
  validates :task_name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { minimum: 5 }
  
  def user
    User.find(self.user_id)
  end
end
