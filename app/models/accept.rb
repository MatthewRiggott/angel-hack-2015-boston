class Accept < ActiveRecord::Base
	belongs_to :user
	belongs_to :recommendation

	validates :user_id, presence: true
	validates :recommendation_id, presence: true
end
