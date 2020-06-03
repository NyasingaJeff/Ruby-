class ApplicationController < ActionController::Base
    # to start first by cheking the parameters
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    #check what this does
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keyss[:name])
        devise_parameter_sanitizer.permit(:account_update, keyss[:name])
                
    end
end
