class ApplicationController < ActionController::Base 
  before_action :configure_permitted_parameters, if: :devise_controller? 

  def autheniticate_customer!
    if current_customer == nil
      flash[:notice]="ログインが必要です"
      redirect_to new_customer_session_path
    end
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    end
end
