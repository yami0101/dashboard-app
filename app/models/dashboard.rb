class Dashboard < ApplicationRecord

  belongs_to :user
  acts_as_list scope: :user

  validates :title, presence: true
  validates :title, length: { minimum: 3 }
end
