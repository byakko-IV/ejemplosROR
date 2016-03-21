class Category < ActiveRecord::Base
	has_many :articles, through: :has_categories
	has_many :has_categories
	validates :name, presence: true
end
