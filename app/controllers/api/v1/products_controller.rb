class Api::V1::ProductsController < ApplicationController
  before_action :find_product, only: [:show, :update, :destroy]
  before_action :current_api_v1_user

  def index
    @products = Product.all
    render json: @products
  end

  def show
    render json: @product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
     render json: @product
    else
     render error: { error: 'Unable to create Product.'}, status: 400
    end
  end

  def update
    if @product
     @product.update(product_params)
     render json: { message: 'Product successfully update.'}, status:200
    else
     render json: { error: 'Unable to update Product.'}, status:400
    end
  end

  def destroy
    if @product
     @product.destroy
     render json: { message: 'Product successfully deleted.'}, status:200
    else
     render json: { error: 'Unable to delete Product. '}, status:400
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :user_id,
      :list_id,
      :product_id,
      :title,
      :name,
      :category,
      :germany,
      :quantity,
      :weight,
      :price,
      :buy,
      :expiry,
      :keep,
      :end,
      :shop,
      :sale,
      :bought,
      :total,
      :rate,
      :out
    )
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
