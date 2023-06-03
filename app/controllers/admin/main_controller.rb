class Admin::MainController < ApplicationController
    def index
        @sellers = Role.second.accounts 
        @customers = Role.third.accounts
    end

    def edit
        @seller = Account.find(params[:id])
    end
        
    def update
        @seller = Account.find(params[:id])
        
      if @seller.update(account_params)
        redirect_to @seller
      else
        render :edit, status: :unprocessable_entity
      end
    end
        
    def destroy
        @seller = Account.find(params[:id])
        @seller.destroy
        
        redirect_to root_path, status: :see_other
    end
        
    private
    def account_params
        params.require(:account).permit(:email, :firsname,:lastname,:age,:gender,:phone,:address)
    end
        

end
