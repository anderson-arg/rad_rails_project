class ListsController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
    # Filter by user:
    #@lists = List.where("user_id = ?", current_user.id)
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list_items = Kaminari.paginate_array(@list.items).page(params[:page]).per(4)
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @list.user = current_user
    
    if @list.save
      flash[:success] = 'Lista criada com sucesso!'
      redirect_to @list
    else
      flash[:danger] = @list.errors.full_messages.to_sentence
      redirect_to new_list_path(@list)
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    if @list.update(list_params)
      flash[:success] = 'Lista atualizada com sucesso!'
      redirect_to @list
    else
      flash[:danger] = @list.errors.full_messages.to_sentence
      redirect_to edit_list_path(@list)
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    flash[:success] = 'Lista excluida com sucesso'
    redirect_to lists_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title, :description)
    end
end
