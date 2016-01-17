class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :update]

	def index
		if signed_in?
			@categories = Category.order('name')
		else
			redirect_to root_path
		end
	end

	def show
		if signed_in?
			@order = Order.new
			@order.quantity = 1
			@order.user_id = current_user.id
			@standalones = @category.meals.select { |meal| meal.standalone == true }
			@composed = @category.meals.select { |meal| meal.standalone == false }
		else
			redirect_to root_path
		end
	end

	def update
		if signed_in? && current_user.admin
    		@category.update(category_params)
    		@categories = Category.order('name')
    	end
  	end

	private

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      allow = [:name, :description]
      params.require(:category).permit(allow)
    end

end