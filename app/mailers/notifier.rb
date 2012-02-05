class Notifier < ActionMailer::Base
 
  def support_notification(sender)
    @sender = sender
    mail(:to => "wasi.cjr@gmail.com",
         :from => sender.email,
         :subject => "New #{sender.support_type}")
 end

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>",:from => "ryan@railscasts.com", :subject => "Registered")
  end

end
