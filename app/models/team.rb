class Team < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :tourneys, through: :participants
  belongs_to :user, foreign_key: 'team_owner_id'

  has_attached_file :logo, styles: { original: '200x200#', thumb: '100x100#' },
                           processors: [:thumbnail, :compression],
                           default_url: "images/missing.png"
  validates :name, presence: true
  validates_attachment_content_type :logo, content_type: ["image/jpg", "image/jpeg", "image/png"]

  def owner
    User.find_by_id(self.team_owner_id).nick
  end
end
