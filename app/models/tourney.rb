class Tourney < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :teams, through: :participants

  validates :name, presence: true
end
