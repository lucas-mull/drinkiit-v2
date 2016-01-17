class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :meal
	has_and_belongs_to_many :ingredients
end
