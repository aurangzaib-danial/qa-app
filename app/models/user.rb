class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
  devise :omniauthable, omniauth_providers: %i[facebook]
 
  def name_initial
    name[0].capitalize
  end

  def self.from_omniauth(auth)
    user = find_or_initialize_by(email: auth.info.email) do |u|
      u.password = Devise.friendly_token[0, 20]
    end
    user.update(name: auth.info.name) # always update user's name, they might have changed it on Facebook
    user
  end
end
