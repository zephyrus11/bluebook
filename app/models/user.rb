class User < ApplicationRecord

	validates :username,  presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 }
	has_secure_password

	has_many :authentications, dependent: :destroy

	def self.create_with_auth_and_hash(authentication, auth_hash)
		user = self.create!(
		username: auth_hash["info"]["name"],
		email: auth_hash["info"]["email"],
		password: SecureRandom.hex(10)
		)
		user.authentications << authentication
		return user
	end

	# grab google to access google for user data
	def google_token
		x = self.authentications.find_by(provider: 'google_oauth2')
		return x.token unless x.nil?
	end

end
