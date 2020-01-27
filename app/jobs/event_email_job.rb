class EventEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ReminderMailer.baseEmail(*args[0], *args[1]).deliver
  end
end
