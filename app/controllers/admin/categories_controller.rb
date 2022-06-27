class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @search = params[:name]
    if @search.present?
      @categories = Category.where('name ILIKE ?', "%#{params[:name]}%").page(params[:page]).per(15)
    else
      @categories = Category.all.page(params[:page]).per(15)
    end
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save!
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update!(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy!
    redirect_to admin_categories_path
  end
  
  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name, :product_id, :ancestry)
  end
end
