class Task < ApplicationRecord
  belongs_to :task_category

  scope :due_today, -> { where(due_date: Date.today) }
  scope :completed, -> { where(completed: true) }

  validates :name, presence: true
  validates :description, length: { maximum: 200 }
end
