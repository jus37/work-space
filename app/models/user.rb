class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  
  with_options presence: true do
    validates :name
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 } do
    validates :telephone
  end
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: PASSWORD_REGEX }



end
