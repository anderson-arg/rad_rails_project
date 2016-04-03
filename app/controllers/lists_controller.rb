class ListsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :set_user
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
    @all_lists = @user ? @user.lists.most_recent : List.most_recent
    @lists = @user ? Kaminari.paginate_array(@all_lists).page(params[:page]).per(20) : Kaminari.paginate_array(@all_lists).page(params[:page]).per(4)
    respond_to do |format|
      format.html { redirect_to root_url if @user != nil && @user != current_user  }
      format.xml { render :xml => @all_lists }
      format.json { render :json => @all_lists }
      format.atom { render :atom => @all_lists }
    end
  end
  
  def show
    @list_items = Kaminari.paginate_array(@list.items).page(params[:page]).per(4)
    @user = @list.user
    respond_to do |format|
      format.html { redirect_to root_url if @user != current_user }
      format.xml { render :xml => @list }
      format.json { render :json => @list }
    end
  end

  def new
    if @user
      @list = List.new
    else
      redirect_to root_url
    end
  end
  
  def edit
    if !@user
      redirect_to root_url
    end
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    
    if @list.save
      flash[:success] = 'Lista criada com sucesso!'
      redirect_to user_lists_path(@user)
    else
      flash[:danger] = @list.errors.full_messages.to_sentence
      redirect_to  new_user_list_path(@user)
    end
  end

  def update
    if @list.update(list_params)
      flash[:success] = 'Lista atualizada com sucesso!'
      redirect_to @user ? user_lists_path(@user) : @list
    else
      flash[:danger] = @list.errors.full_messages.to_sentence
      redirect_to edit_user_list_path(@user, @list)
    end
  end

  def destroy
    if @user
      @list.destroy
      flash[:success] = 'Lista excluida com sucesso'
      redirect_to user_lists_url(@user)
    else
      redirect_to root_url
    end
  end

  private
    def set_list
      @list = @user.nil? ? List.find(params[:id]) : @user.lists.where(:id => params[:id]).first
      redirect_to root_url if !@list
    end
    
    def set_user
      @user = params[:user_id] ? User.friendly.find(params[:user_id]) : nil
    end
    
    def check_user
      redirect_to root_url if @list.user != current_user
    end

    def list_params
      params.require(:list).permit(:title, :description, :list_category_id)
    end
end
