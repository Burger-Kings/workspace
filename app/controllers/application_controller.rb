class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 会員でないユーザーの閲覧制限をどこまでかけるかを要検討
  before_action :authenticate_user!, except: [:top, :about]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resorce)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana, :email,:postal_code, :address, :telephone_number, :is_active ])
  end
end
