class ProductsController < ApplicationController
  def index
    @product = Product.all.includes(:images)
    @parents = Category.all.order("id ASC").limit(13)
  end


  def new
    @product = Product.new
    @product.images.build
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
    # @image = Image.find(params[:product_id])　現在詳細画面で画像を表示しないようにしています。（エラーが出るため確認中）
  end
  
  private
  def product_params
    params.require(:product).permit(
      :title, :text, :price, :saler_id,
      images_attributes: [:image_url]
    )
  end
end
