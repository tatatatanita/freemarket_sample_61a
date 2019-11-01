class ProductsController < ApplicationController
  # def index
  #   @product = Product.all
  # end


  # def new
  #   @product = Product.new
  # end

  # def create
  #   # raise.params.inspect
  #   @product = Product.create(product_params)
  #   if @product.save
  #     redirect_to root_path, notice: '出品しました'
  #   end
  # end

  # def destroy
  #   @product == Product.find(params[:id])
  #     if @product.user_id == current_user.id
  #       @product.destroy
  #       # redirect_to 'show_exhibit' 実装後コメントアウト外す
  #     end
  # end 
 
  
  # def show
  #   @product = Product.find(params[:id])
  # end
  
  # private
  # def product_params
  #   params.require(:product).permit(:title, :image, :text, :price)
  # end
end
