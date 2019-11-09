class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :buyer_show]

  before_action :set_product, only: [:update, :destroy, :show, :edit, :buyer_show] 

  def index
    @product = Product.includes(:images)
    @parents = Category.limit(13)
  end


  def new
    @product = Product.new
    @product.images.build
    @product.build_freight
    @product.build_root_area
    @product.build_day
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else 
      render :new, notice: '保存できませんでした'
    end
  end

  def destroy
    @products = current_user.products
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to show_exhibit_user_path
    else
      render :show, notice: '削除できませんでした'
    end
  end
 
  def show
    @products = current_user.products.includes(:images)
    @user = current_user
    @image = Image.where(product_id: @product)
  end

 
  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path, notice: ''
    else
      render 'edit'
    end
  end

  def buyer_show
    @image = Image.where(product_id: @product)
  end
  
  private
  def product_params
    params.require(:product).permit(
      :title, :text, :price, :saler_id,
      images_attributes: [:image_url],
      freight_attributes: [:freight],
      root_area_attributes: [:root_area],
      day_attributes: [:day]
    )
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
