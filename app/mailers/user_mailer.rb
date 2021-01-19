class UserMailer < ApplicationMailer
  default from: 'LUXURY_WATCHES@example.com', to: 'admin@example.com'

  def сonfirmation_email
    @user = params[:user]
    @order = params[:order]
    mail(to: @user.email, subject: 'Поздравляем! Вы совершили покупку на сайте LUXURY WATCHES!')
  end
end
