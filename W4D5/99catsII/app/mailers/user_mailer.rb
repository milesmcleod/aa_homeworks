class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)

    @user = user
    @joogs = 'localhost:3000/session/new'

    mail(to: 'pickles@gmail.com', subject: 'Come thru my website')


  end
end
