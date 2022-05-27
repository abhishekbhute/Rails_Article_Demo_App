class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user 
        #  ||= evaluate current_user if not evaluated before ,dont evaluate or hit db every time this function is called
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    

    def logged_in?
        #convert to boolean
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform this action"
            redirect_to login_path
        end
    end


   
end
