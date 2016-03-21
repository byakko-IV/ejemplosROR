class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :has_categories
	has_many :categories, through: :has_categories


	validates :title, presence: true, length: { minimum: 5 }, uniqueness: true
	validates :text, presence: true, length: { minimum: 20 }
	after_create :save_categories


	#Esto se llama custom setter
	def categories=(value)
		@categories = value
	end

	private

	def save_categories
		@categories.each do |category_id|
			HasCategory.create(category_id: category_id, article_id: self.id)
		end
	end
end
