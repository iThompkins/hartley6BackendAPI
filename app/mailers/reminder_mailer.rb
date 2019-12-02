class ReminderMailer < ApplicationMailer
	default :from => 'yd2473@columbia.edu'

	def baseEmail(email)
		mail( :to => email,
    	:subject => 'Reminder to visit event!' )		
	end
end