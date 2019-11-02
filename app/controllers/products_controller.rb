class ProductsController < ApplicationController
  def index
    @product = Product.all
    @parents = Category.all.order("id ASC").limit(13)
  end


  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    # binding.pry
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
  end
  
  private
  def product_params
    params.require(:product).permit(:title, :image, :text, :price)
  end
end
