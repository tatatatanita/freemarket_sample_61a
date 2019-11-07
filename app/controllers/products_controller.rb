class ProductsController < ApplicationController
  def index
    @product = Product.all.includes(:images)
    @parents = Category.all.order("id ASC").limit(13)
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
    @product == Product.find(params[:id])
      if @product.user_id == current_user.id
        @product.destroy
        # redirect_to 'show_exhibit' 実装後コメントアウト外す
      end
  end 
 
  
  def show
    @product = Product.find(params[:id])
  end

  def buyer_show
    @product = Product.find(params[:id])
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
end
