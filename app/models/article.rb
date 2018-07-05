class Article < ApplicationRecord
	validates :title, presence: true
	has_many :comments, dependent: :destroy
  	validates :title, presence: true
end