class Recommendation < ActiveRecord::Base
	belongs_to :user_recommendation
	has_many :accepts
	has_many :users, through: :user_recommendations

  geocoded_by :full_street_address

  validates :title, presence: true
  validates :details, presence: true

  after_validation :geocode, if: :address_changed?

  def full_street_address
    "#{address}#{city}#{state}"
  end

  def owner_or_admin?(logged_in_user)
    user == logged_in_user || logged_in_user.admin
  end
end
