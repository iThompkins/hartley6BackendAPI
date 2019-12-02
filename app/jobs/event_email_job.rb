class EventEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ReminderMailer.baseEmail(*args[0]).deliver
  end
end
