class User < ApplicationRecord
  has_many :recipes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  
  # # unlike laravell the attributes are validated huku
    validates  :name, presence: true, length: {maximum: 50}
    validates :email, presence: true
end
