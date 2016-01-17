class MealsController < ApplicationController
	before_action :set_meal, only: [:update, :destroy]

	def new
    if signed_in?
  		@meal = Meal.new
  		@meal.category_id = params[:category_id]
  		@meal.standalone = params[:standalone]
    else
      redirect_to root_path
    end
	end

	def update
	end

	def create
    if signed_in?
      set_success(true, "Plat créé avec succès !")
      @meal = Meal.new(meal_params)
      if @meal.save
        set_menu
      else
        set_success(false, "Erreur lors de la création du plat")
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if signed_in?
      set_success(true, "Plat supprimé !")
      if @meal.destroy
        set_menu
      else
        set_success(false, "Une erreur est survenue lors de la suppression")
      end
    else
      redirect_to root_path
    end
  end

	private

    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    def set_menu
      @category = @meal.category
      @standalones = @category.meals.select { |meal| meal.standalone == true }
      @composed = @category.meals.select { |meal| meal.standalone == false }
      @order = Order.new
      @order.quantity = 1
    end

    def meal_params
      allow = [:description, :price, :category_id, :standalone]
      params.require(:meal).permit(allow)
    end

end