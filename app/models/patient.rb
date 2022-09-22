class Patient < ApplicationRecord
  belongs_to :user
  has_many :healthcare_teams
  has_many :doctors, through: :healthcare_teams

  def fullname
    user ? user.fullname : nil
  end
end
