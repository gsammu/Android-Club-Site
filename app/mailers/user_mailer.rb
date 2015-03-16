class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.task_reminder.subject
  #
  def task_reminder(user)
    @greeting = "Hi"
    @user = user
    @todo_list = user.todo_lists.where("deadline < ?", Time.now + 1.day).
                      where("deadline > ?", Time.now)
    mail to: user.email, subject: "Task Reminder "
  end
end
