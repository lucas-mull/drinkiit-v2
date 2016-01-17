class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if (!signed_in? || !current_user.admin)
      redirect_to root_path
    end

    set_promos
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: users_path }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @success = true
    @message = 'Modifications enregistrées !'
    if !@user.update(user_params)
      @success = false
      @message = 'Une erreur est survenue !'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @success = true
    @message = 'Utilisateur supprimé !'
    if !@user.destroy
      @success = false
      @message = 'Une erreur est survenue !'
    else
      set_promos
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_promos
      promos = User.get_all_promos
      puts promos
      @users = Hash.new('promos')
      promos.each do |promo|
        @users[promo['promo']] = User.where('promo = ' + promo['promo'])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      allow = [:lastname, :name, :uid, :email, :admin, :solde, :promo]
      params.require(:user).permit(allow)
    end
end
