class ReminderMailer < ApplicationMailer
	default :from => 'yd2473@columbia.edu'

	def baseEmail(email, ev)
		@event = ev
		mail( :to => email,
    	:subject => 'Reminder to visit event!' )		
	end
end