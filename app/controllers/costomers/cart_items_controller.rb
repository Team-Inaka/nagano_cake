class Costomers::CartItemsController < ApplicationController
  before_action :set_costomers_cart_item, only: [:show, :edit, :update, :destroy]

  # GET /costomers/cart_items
  # GET /costomers/cart_items.json
  def index
    @costomers_cart_items = CartItem.all
  end

  # GET /costomers/cart_items/1
  # GET /costomers/cart_items/1.json
  def show
  end

  # GET /costomers/cart_items/new
  def new
    @costomers_cart_item = CartItem.new
  end

  # GET /costomers/cart_items/1/edit
  def edit
  end

  # POST /costomers/cart_items
  # POST /costomers/cart_items.json
  def create
    @costomers_cart = current_cart
    product = Product.find(params[:costomers_cart_item][:product_id])
    @costomers_cart_item = @costomers_cart.cart_items.new(costomers_cart_item_params)

    respond_to do |format|
      if @costomers_cart_item.save
        format.html { redirect_to costomers_cart_path(@costomers_cart), notice: 'カートが作成されました' }
        format.json { render :show, status: :created, location: @costomers_cart_item }
      else
        format.html { render :new }
        format.json { render json: @costomers_cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costomers/cart_items/1
  # PATCH/PUT /costomers/cart_items/1.json
  def update
    respond_to do |format|
      if @costomers_cart_item.update(costomers_cart_item_params)
        format.html { redirect_to costomers_cart_path(@costomers_cart), notice: 'カートが更新されました' }
        format.json { render :show, status: :ok, location: @costomers_cart_item }
      else
        format.html { redirect_to costomers_cart_path(@costomers_cart), notice: '1以上の数字を入力してください' }
        format.json { render json: @costomers_cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costomers/cart_items/1
  # DELETE /costomers/cart_items/1.json
  def destroy
    @costomers_cart_item.destroy
    respond_to do |format|
      format.html { redirect_to costomers_cart_url(@costomers_cart_item.cart_id), notice: '商品をカートから削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costomers_cart_item
      @costomers_cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def costomers_cart_item_params
      params.require(:costomers_cart_item).permit(:costomer_id, :product_id, :cart_id, :number)
    end
end
