class IngredientsController < ApplicationController

	before_action :set_type, only: [:update, :destroy]

	def index
		if signed_in? && current_user.admin
			@types = IngredientType.order('name')
		else
			redirect_to root_path
		end
	end

	def new
		if signed_in? && current_user.admin
	  		@ingredient = Ingredient.new
	  		@ingredient.ingredient_type_id = params[:ingredient_type_id]
	    else
	      redirect_to root_path
	    end
	end

	def newType
		if signed_in? && current_user.admin
			@type = IngredientType.new
		else
			redirect_to root_path
		end
	end

	def create
	    if signed_in? && current_user.admin
	      set_success(true, "Ingrédient créé avec succès !")
	      @ingredient = Ingredient.new(ingredient_params)
	      if @ingredient.save
	        @types = IngredientType.order('name')
	      else
	        set_success(false, "Erreur lors de la création de l'ingrédient")
	      end
	    else
	      redirect_to root_path
	    end
  	end

  	def createType
	    if signed_in? && current_user.admin
	      set_success(true, "Catégorie créé avec succès !")
	      @type = IngredientType.new(ingredient_type_params)
	      if @type.save
	        @types = IngredientType.order('name')
	      else
	        set_success(false, "Erreur lors de la création de la catégorie")
	      end
	    else
	      redirect_to root_path
	    end
  	end

	def update
		if signed_in? && current_user.admin
    		@ingredient.update(ingredient_params)
    		@types = IngredientType.order('name')
    	end
  	end

  	def destroy
  	end

	private

    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = IngredientType.find(params[:id])
    end

    def ingredient_params
      allow = [:name, :ingredient_type_id]
      params.require(:ingredient).permit(allow)
    end

    def ingredient_type_params
		allow = [:name]
		params.require(:ingredient_type).permit(allow)
    end

end
