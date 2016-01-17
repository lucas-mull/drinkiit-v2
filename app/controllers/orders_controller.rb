class OrdersController < ApplicationController
before_action :set_order, only: [:validate, :destroy]

	def index
		if signed_in? && current_user.admin
			set_order_list
		else
			redirect_to root_path
		end
	end

	def show
		if signed_in?
			set_my_orders
		else
			redirect_to root_path
		end
	end

	def create
		@success = true
		@message = "Commande effectuée avec succès !"
		if signed_in?
		    @order = Order.new(order_params)		    
		    @meal = Meal.find(@order.meal_id)
		    @order.total = @order.quantity * @meal.price
		    if current_user.solde - @order.total >= 0
		    	if check_user_for(@order)			    
				    @order.served = false
				    @order.ordered_at = DateTime.now
				    if !@order.save
				    	@success = false
				    	@message = "Une erreur est survenue"
			    	end
				else
					@success = false
					@message = "Erreur d'authentification !"
				end
			else
				@success = false
				@message = "Vous n'avez pas assez d'argent !"
		    end 
		else
			redirect_to root_path
		end
  	end

  	def validate
  		@success = true
  		@message = "Commande archivée !"
  		@user = @order.user
  		new_solde = @user.solde - @order.total
  		if !(@user.update_attribute('solde', new_solde) && @order.update_attribute('served', true))
  			@success = false
  			@message = "Une erreur est survenue"
  		else
  			set_order_list
		end
  	end

  	def destroy
  		if signed_in?
	  		@success = true
	  		@message = "Commande supprimée !"
	  		if !@order.destroy
	  			@success = false
	  			@message = "Une erreur s'est produite lors de la suppression"
	  		else
	  			set_my_orders
	  		end
	  	else
	  		redirect_to root_path
	  	end
  	end

	private

	def set_order
		@order = Order.find(params[:id])
	end

	def set_order_list
		@orders = Order.order('ordered_at')
		@today = @orders.select { |order| order.served == false && order.ordered_at.to_date == DateTime.now.to_date }
		@historique = @orders.select { |order| order.served == true || order.ordered_at.to_date != DateTime.now.to_date }
	end

	def set_my_orders
		@notserved = current_user.orders.select { |order| order.served == false }
		@served = current_user.orders.select { |order| order.served == true }
	end

	def check_user_for(order)
		status = current_user.id == order.user_id
	end

	def order_params
      allow = [:quantity, :meal_id, :user_id, :comment]
      params.require(:order).permit(allow)
    end

end
