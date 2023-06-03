class Seller::ProductsController < ApplicationController

def index
    @products = current_account.products       
end
def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_account.products.new
  end

  def create
    @product = current_account.products.new(product_params)

    if @product.save
      redirect_to [:seller,@product]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to [:seller,@product]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :actual_price,:current_price,:description,:image,:category_id)
    end

end