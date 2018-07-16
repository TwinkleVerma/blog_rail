class Article < ApplicationRecord
	validates :title, presence: true
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :category
end