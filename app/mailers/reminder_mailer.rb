class ReminderMailer < ApplicationMailer
	default :from => 'theeventoapp@gmail.com'

	def baseEmail(email, ev)
		@event = ev
		mail( :to => email,
    	:subject => 'Reminder to visit event!' )		
	end
end