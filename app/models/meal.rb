class Meal < ActiveRecord::Base
	belongs_to :category
	has_many :orders
	has_and_belongs_to_many :ingredient_types

	class << self

		def get_standalones_for(category_id)
			self.where("category_id = ? AND standalone = true", category_id)
		end

		def get_composed_meals_for(category_id)
			self.where("category_id = ? AND standalone = false", category_id)
		end
	end
end
