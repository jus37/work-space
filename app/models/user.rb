class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :clips
  has_many :shops, through: :clips, dependent: :destroy

  with_options presence: true do
    validates :name
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 } do
    validates :telephone
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: PASSWORD_REGEX }

  def self.guest
    find_or_create_by!(email: 'test.com') do |user|
      user.password = "111111a"
    end

end
