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
    @product.build_condition
    @product.build_freight
    @product.build_root_area
    @product.build_day
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
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
    @products = current_user.products.includes(:images)
    @user = current_user
    @image = Image.where(product_id: @product)
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

    @conditions = Condition.find_by product_id: @product
    case @conditions.condition
    when 1
      @condition = "新品、未使用"
    when 2
      @condition = "未使用に近い"
    when 3
      @condition = "目立った傷や汚れなし"
    when 4
      @condition = "やや傷や汚れあり"
    when 5
      @condition = "傷や汚れあり"
    else
      @condition = "全体的に状態が悪い"
    end

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
      condition_attributes: [:condition],
      freight_attributes: [:freight],
      root_area_attributes: [:root_area],
      day_attributes: [:day]
    )
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
