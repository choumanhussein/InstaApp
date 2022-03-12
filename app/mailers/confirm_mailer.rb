class ConfirmMailer < ApplicationMailer
  def confirm_mail(confirm, current_user_info)
    @confirm = confirm
    mail to: current_user_info.email, subject: "Confirmation De Votre Email !"
  end
end
