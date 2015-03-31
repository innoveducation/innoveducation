class UserMailer < ActionMailer::Base
  default from: "noreply@innoveducation.ru"
  def welcome_email(name, email, message)
	@name = name
	@email = email
	@message = message
    mail(to: "info@innoveducation.ru", subject: 'Сообщение с сайта innoveducation.ru')
  end
end
