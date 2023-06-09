class Task < ApplicationRecord
  extend Enumerize

  belongs_to :user

  enumerize :priority, in: %i[low medium high]

  validates :title, presence: true
  validates :priority, presence: true
  validates :due_date, presence: true
end
