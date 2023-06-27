class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    @user_path
    #一時的な措置 最終的に/user/:id に変更する
    #@user_pathで目的のページへ遷移したがなぜそうなるのかわからない
  end

#  def after_sign_our_path_for(resource)
#    homes_top_path
#  end
#デフォルトの遷移先がroot_pathのため、上記コードは必要なかった

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
