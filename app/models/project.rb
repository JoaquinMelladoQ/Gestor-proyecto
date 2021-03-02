class Project < ApplicationRecord
  validates :name, :description, :state, presence: true
  enum state: [:proposal, :in_progress, :finished]
end
