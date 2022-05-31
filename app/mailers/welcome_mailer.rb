class WelcomeMailer < ApplicationMailer
    def welcome_email
        @user = User.find(1)
        mail(to: @user.email, subject: 'Welcome to Alpha Blogs')
    end
end

