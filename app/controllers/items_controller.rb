class ItemsController < ApplicationController
  before_action :logged_in_user
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    list = List.find(params[:list_id])
    @item = list.items.new(item_params)

    if @item.save
      flash[:success] = 'Item cridado com sucesso!'
      redirect_to list
    else
      flash[:danger] = @item.errors.full_messages.to_sentence
      redirect_to new_list_item_path(@item.list_id)
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    list = List.find(params[:list_id])
    #2nd you retrieve the comment thanks to params[:id]
    @item = list.items.find(params[:id])

    if @item.update(item_params)
      flash[:success] = 'Item atualizado com sucesso!'
      redirect_to list_path(list)
    else
      flash[:danger] = @item.errors.full_messages.to_sentence
      redirect_to edit_list_item_path(@item.list_id)
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to list_url(@item.list) }
      format.js   { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:text)
    end
end
