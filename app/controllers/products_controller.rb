# frozen_string_literal: true

# Controller for Products table
class ProductsController < ApplicationController
  before_action :set_product, only: %i[update destroy]

  # GET /products or /products.json
  def index
    @product = Product.new
    set_products
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.save
    set_products
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product.update(product_params)
    set_products
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    set_products
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:reference, :name, :category, :price)
  end

  def set_products
    @products = Product.includes(:destination).all.order(created_at: :desc)
  end
end
