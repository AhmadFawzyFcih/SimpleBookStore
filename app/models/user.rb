class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook , :google_oauth2]
 

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.name = "user full name"
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  mount_uploader :image , ImageUploader
  validates :name, presence: true, length: {maximum: 100}

end
