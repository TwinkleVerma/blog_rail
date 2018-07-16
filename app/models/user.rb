class User < ApplicationRecord
	validates :email, presence: true
	validates :password, presence: true
	validates :username, presence: true
	has_many :comments, dependent: :destroy
	has_many :articles, dependent: :destroy
end
