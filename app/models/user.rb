class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
 
  def name_initial
    name[0].capitalize
  end
end
