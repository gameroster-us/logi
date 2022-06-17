class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:get_product_page, :show]

  def index
    @products = Product.all.page(params[:page]).per(15)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update!(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def get_product_page
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image)
  end
end
