module RainbowGate
  class User < ApplicationRecord
    include RainbowStride::UserExtension
    include RainbowVital::UserExtension

    self.table_name = 'users'
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :confirmable, :lockable, :timeoutable, :trackable,
           :omniauthable, omniauth_providers: [:google_oauth2]

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.full_name = auth.info.name
        user.skip_confirmation!
      end
    end
  end
end
