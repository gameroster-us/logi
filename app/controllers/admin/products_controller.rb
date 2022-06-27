class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:get_product_page, :show]
  # before_action :categories_list, only:  [:edit , :new]

  def index
    @search = params[:name]  
    if @search.present?
      @products = Product.where('name ILIKE ?', "%#{params[:name]}%").page(params[:page]).per(15)
    else
      @products = Product.all.page(params[:page]).per(15)
    end
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
    @search = params[:name]  
    if @search.present?
      @products = Product.where('name ILIKE ?', "%#{params[:name]}%").page(params[:page]).per(15)
    else
      @products = Product.all.page(params[:page]).per(15)
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image, :category_id)
  end

  # def categories_list
  #   @category = Category.all.map {|p| [p.name, p.id]}
  # end
end
