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
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).limit(13).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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

    @freights = Freight.find_by product_id: @product
    if @freights.freight == 1
      @freight = "送料込み(出品者負担)"
    else
      @freight = "着払い(購入者負担)"
    end

    @root_areas = RootArea.find_by product_id: @product
    @root_area = @root_areas.root_area

    @days = Day.find_by product_id: @product
    if @days.day == 1
      @day = "1~2日で発送"
    elsif @days.day == 2
      @day = "2~3日で発送"
    else
      @day = "4~7日で発送"
    end
  end
  
  private
  def product_params
    params.require(:product).permit(
      :title, :text, :price, :saler_id, {categories: []},
      images_attributes: [:image_url],
      freight_attributes: [:freight],
      root_area_attributes: [:root_area],
      day_attributes: [:day]
    )
  end
end
