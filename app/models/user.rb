class User < ApplicationRecord # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable # Include default devise modules. Others available are:
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  enum gender: { other: 0, male: 1, female: 2 }
  has_many :activities, dependent: :destroy
end
