class User < ApplicationRecord

	validates :email, presence: true
	validates :password, presence: true
	validates :username, presence: true
	has_many :comments, dependent: :destroy
	has_many :articles, dependent: :destroy
	has_many :likes, as: :like, dependent: :destroy
  has_one :image, dependent: :destroy

  accepts_nested_attributes_for :image 
end
