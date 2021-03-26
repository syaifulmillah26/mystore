class AdminMailer < ApplicationMailer

  def registration_mailer
    @token = params[:token]
    mail(to: params[:email], subject: "Registration Confirmation")
  end

  def activation_mailer
    mail(to: params[:email], subject: "Email Activation")
  end

  def validation_mailer
    mail(to: params[:email], subject: "Account Validation")
  end
  

end
