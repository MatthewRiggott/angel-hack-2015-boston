class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)

    email_is_verified = auth.info.email && auth.info.verified
    email = auth.info.email if email_is_verified
    binding.pry
    token = auth.credentials.token
    user = User.where(email: email).first if email
    if user.nil?
      binding.pry
      user = User.new(
        first_name: auth.extra.raw_info.first_name,
        last_name: auth.extra.raw_info.last_name,
        facebook_id: auth.extra.raw_info.id,
        token: token,
        email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
        password: Devise.friendly_token[0,20]
      )
      user.save!
    end
    user.update(token: token)
    user
  end

end
