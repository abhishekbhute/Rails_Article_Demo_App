# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
    def welcome_email
        user = User.new(username:"abhibhute",email: "abbybhute@gmail.com", password: "Password")
        WelcomeMailer.with(user: user).welcome_email
    end
end
