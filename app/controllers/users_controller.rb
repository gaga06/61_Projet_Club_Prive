class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if logged_in?
    @users = User.all
    render 'index'
  else
    flash[:danger] ='Vous devez vous connecter pour accéder à la page'
    redirect_to login_path
  end
end

  # GET /users/1
  # GET /users/1.json
  def show
      if current_user.nil?
      flash[:danger] = 'Vous devez vous connecter pour accéder à cette page !'
      redirect_to login_path
    elsif current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      render 'show'
    else
      flash[:danger] = 'Vous devez vous connecter pour accéder à cette page !'
      redirect_to login_path
    end
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
        format.html { redirect_to users_path, notice: 'Vous avez bien créé votre compte' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to login_url, notice: 'Vos modifications ont bien été enregistrées' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
