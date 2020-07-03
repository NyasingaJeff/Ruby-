class User < ApplicationRecord
  before_save{self.email = email.downcase} #callback before savin
   has_many :recipes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  
  # # unlike laravell the attributes are validated huku
    validates  :name, presence: true, length: {maximum: 50}
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  #this is provided on the net.. it provides a format
    validates :email, presence: true, uniqueness: {case_sensitive: false},
               format: {with: VALID_EMAIL_REGEX}         
end
