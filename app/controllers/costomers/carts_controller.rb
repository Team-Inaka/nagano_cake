class Costomers::CartsController < ApplicationController
  before_action :set_costomers_cart, only: [:show, :edit, :update, :destroy]

  # GET /costomers/carts
  # GET /costomers/carts.json
  def index
    @costomers_carts = Cart.all
  end

  # GET /costomers/carts/1
  # GET /costomers/carts/1.json
  def show
  end

  # GET /costomers/carts/new
  def new
    @costomers_cart = Cart.new
  end

  # GET /costomers/carts/1/edit
  def edit
  end

  # POST /costomers/carts
  # POST /costomers/carts.json
  def create
    @costomers_cart = Cart.new(costomers_cart_params)

    respond_to do |format|
      if @costomers_cart.save
        format.html { redirect_to @costomers_cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @costomers_cart }
      else
        format.html { render :new }
        format.json { render json: @costomers_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costomers/carts/1
  # PATCH/PUT /costomers/carts/1.json
  def update
    respond_to do |format|
      if @costomers_cart.update(costomers_cart_params)
        format.html { redirect_to @costomers_cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @costomers_cart }
      else
        format.html { render :edit }
        format.json { render json: @costomers_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costomers/carts/1
  # DELETE /costomers/carts/1.json
  def destroy
    @costomers_cart = current_cart
    @costomers_cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to costomers_products_path, notice: 'カートが空になりました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costomers_cart
      @costomers_cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def costomers_cart_params
      params.require(:costomers_cart).permit(:costomer_id)
    end
end
