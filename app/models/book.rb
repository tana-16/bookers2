class Book < ApplicationRecord
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :user
  
  attachment :profile_image
  
end
