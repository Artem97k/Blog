class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    if params[:password] == params[:password_c]
	  @user = User.new(login: params[:login], password: params[:password])
	  if @user.save
		redirect_to root_url, notice: 'User was successfully created.'
	  else
		flash[:notice] = 'Bad user parameters'
		render :new
	  end
	else
	   flash[:notice] = 'Password doesnt match!'
	   render :new
	end
  end

  # PATCH/PUT /users/1
  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
	@current_user = session[:current_user_id] = nil
	redirect_to users_url, notice: 'User was successfully deleted'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :password)
    end
	
	def require_same_user
	  if current_user != @user
	    flash[:notice] = 'Log in!'
		redirect_to root_path
      end
	end
	  
end
