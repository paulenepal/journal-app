class Task < ApplicationRecord
  belongs_to :task_category

  scope :today, -> { where("due_date >= ? AND due_date < ? AND completed = ?", Date.current, Date.current + 1, false).order(due_date: :asc) }
  scope :overdue, -> { where("due_date < ? AND completed = ?", Date.current, false).order(due_date: :asc) }
  scope :completed, -> { where(completed: true) }
  scope :upcoming, -> {where(due_date: Date.current..(Date.current + 2.weeks), completed: false).order(due_date: :asc)} # current date + 2 weeks

  validates :name, presence: true
  validates :description, length: { maximum: 200 }
end
