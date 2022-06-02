class SessionsController < ApplicationController
    
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            debugger
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfully"
            redirect_to user
            WelcomeMailer.with(session[:user_id]).welcome_email.deliver_later
        else
            flash.now[:alert] = "There was something wrong with your login details"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash.now[:alert] = "Logged out"
        redirect_to root_path
    end
end