class ApplicationController < ActionController::Base
    # protect_from_forgery with: :null_session
    def after_sign_in_path_for(resource)
        if current_account.roles.first[:name]== "admin"
            admin_main_index_path(current_account)
        elsif current_account.roles.first[:name] == "seller"     
            seller_products_path
        else
            customer_products_path(current_account)
        end

    end
end
