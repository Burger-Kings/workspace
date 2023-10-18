class Public::CustomerController < ApplicationController

def show
 @customer = current_customer
end

def edit 
 @customer = current_customer
end

def update
 @customer = current_customer
 if @customer.update
    redirect_to customers_mypage_path
 else
    render edit
 end
end

def confirm_withdraw
end

def withdraw
 @customer = current_customer
 @customer.update(is_active: false)
 reset_session
 redirect_to root_path
end

private

def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
end




end
