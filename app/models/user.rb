class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_recommendations
  has_many :accepts
  has_many :recommendations, through: :user_recommendations

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)

    email_is_verified = auth.info.email && auth.info.verified
    email = auth.info.email if email_is_verified
    token = auth.credentials.token
    user = User.where(email: email).first if email
    if user.nil?
      user = User.new(
        first_name: auth.extra.raw_info.first_name,
        last_name: auth.extra.raw_info.last_name,
        facebook_id: auth.extra.raw_info.id,
        token: token,
        email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
        password: Devise.friendly_token[0,20],
        photo: auth.info.image
      )
      user.save!
    end
    user.add_friends
    user
  end

  def my_friends
    test = Friend.where("friends.friend1 = ? OR friends.friend2 = ?", self.id, self.id)
    friends = Array.new
    (test.pluck(:friend1) + test.pluck(:friend2) - [self.id]).uniq.each do |friend|
      friends << friend
    end
    return friends
  end

  def add_friends
    base_url = "https://graph.facebook.com/v2.0"
    access = "?access_token=#{self.token}"
    response = HTTParty.get("#{base_url}/me/friends#{access}")
    friends = []
    response["data"].each do |data|
      friend_id = data["id"]
      friend = User.find_by(facebook_id: friend_id)

      if !friend.nil?
        friend1 = self.id < friend.id ? self : friend
        friend2 = self.id > friend.id ? self : friend
        Friend.find_or_create_by(friend1: friend1.id, friend2: friend2.id)
      end
    end
  end
end
