class Project < ApplicationRecord
  validates :name, :description, :state, presence: true
  enum state: [:proposal, :in_progress, :finished]
  scope :search, ->(param) {where(state: param)}
end
