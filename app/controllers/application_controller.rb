class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # to start first by cheking the parameters
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    # #check what this does
     def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name])                
    end
    def require_login
        if current_user
           #continue
        else
          flash[:warning]="You must be logged in To Do this"
           redirect_back fallback_location: root_path
        end
     end
end
