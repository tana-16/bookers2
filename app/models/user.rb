class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # belongs_to :post_image, dependent: :destroy
  has_many :books, dependent: :destroy

  attachment :profile_image

  validates :introduction, presence: false, length: { maximum: 50 }
  validates :name, length: {in: 2..20}

end
