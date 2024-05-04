class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy


  validates :introduction, length: { maximum: 50 }
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :email, length: { minimum: 2, maximum: 20 }, uniqueness: true

  has_one_attached :profile_image





  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
