class MainController < ApplicationController
  
  def index
    @products = Product.paginate(page: params[:page], per_page: 4)
    @categories = Category.all
    @cloths = Category.find(1).subcategories
    @electric = Category.find(5).subcategories
  end 

  def show
    @account = current_account
   
  end

  private

  def account_params
    params.require(:account).permit(:email, :name)
  end

end
