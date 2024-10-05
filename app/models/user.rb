class User < ApplicationRecord
  has_many :journals, dependent: :destroy
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
