class UsersController < ApplicationController
  before_action :logged_in_user, except: [:create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    redirect_to root_url if @user == nil
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash['success'] = t('controllers.users.create.flash.success')
      log_in @user
      redirect_to root_url
    else
      render 'account/index'
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('controllers.users.update.flash.success')
      log_in @user }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user != null
      log_out
      @user.destroy
    end
    redirect_to root_url
  end

  private
    def set_user
      @user = User.friendly.find("#{params[:id]}")
      @user =  nil if current_user != @user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
