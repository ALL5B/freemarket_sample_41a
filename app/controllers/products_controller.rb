class ProductsController < ApplicationController

  def index
    @products = Product.all
    ladies_ids = Category.find(1).subtree_ids
    @ladies = Product.where(category_id: ladies_ids.first..ladies_ids.last).limit(4).order('created_at DESC')
    mens_ids = Category.find(2).subtree_ids
    mens_ids.pop(1)
    @mens = Product.where(category_id: mens_ids.first..mens_ids.last).limit(4).order('created_at DESC')
    baby_ids = Category.find(3).subtree_ids
    baby_ids.pop(1)
    @baby_products = Product.where(category_id: baby_ids.first..baby_ids.last).limit(4).order('created_at DESC')
    interior_ids = Category.find(4).subtree_ids
    interior_ids.pop(1)
    @interior_products = Product.where(category_id: interior_ids.first..interior_ids.last).limit(4).order('created_at DESC')
  end

  def new
    @product = Product.new
    4.times { @product.product_images.build}
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      Trade.create(product_id: @product.id)
      redirect_to root_path(@product)
    else
      render :action => "new"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end

  def search
    @keyword = params[:keyword]
    @products = Product.where('name LIKE(?) OR detail  LIKE(?)',"%#{params[:keyword]}%","%#{params[:keyword]}%").limit(20)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.seller == current_user.id
      @product.update(update_product_params)
      redirect_to root_path(@product)
    else
      render action: "edit"
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail, :condition, :category_id, :size_id, :shipingfee_id, :shipment_id, :area_id, :shipmentday, :price, product_images_attributes: [:image]).merge(seller: current_user.id)
  end

  def update_product_params
    params.require(:product).permit(:name, :detail, :condition, :category_id, :size_id, :shipingfee_id, :shipment_id, :area_id, :shipmentday, :price, product_images_attributes: [:image, :destroy, :id]).merge(seller: current_user.id)
  end
end
