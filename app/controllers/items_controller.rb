class ItemsController < ApplicationController
  before_action :logged_in_user
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end
  
  def new
    @item = Item.new
  end

  def edit
  end

  def create
    list = List.find(params[:list_id])
    @item = list.items.new(item_params)

    if @item.save
      flash[:success] = 'Item cridado com sucesso!'
      redirect_to user_list_path(current_user,list)
    else
      flash[:danger] = @item.errors.full_messages.to_sentence
      redirect_to new_user_list_item_path(current_user, @item.list_id)
    end
  end
  
  def update
    list = List.find(params[:list_id])
    #2nd you retrieve the comment thanks to params[:id]
    @item = list.items.find(params[:id])

    if @item.update(item_params)
      flash[:success] = 'Item atualizado com sucesso!'
      redirect_to user_list_path(current_user,list)
    else
      flash[:danger] = @item.errors.full_messages.to_sentence
      redirect_to edit_user_list_item_path(current_user, @item.list_id, @item)
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to user_list_url(current_user, @item.list) }
      format.js   { render :layout => false }
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:text, :order, :item_type_id, :is_active, :is_private)
    end
end
