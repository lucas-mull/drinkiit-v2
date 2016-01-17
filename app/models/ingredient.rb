class Ingredient < ActiveRecord::Base
	belongs_to :ingredient_type
	has_and_belongs_to_many :orders
end
