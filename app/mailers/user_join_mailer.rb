class UserJoinMailer < ApplicationMailer
	default :from => 'yd2473@columbia.edu'

	def joined(joiner_email, getter_email)
		@joiner_email = joiner_email
		@getter_email = getter_email
		mail( :to => @getter_email,
    	:subject => 'Someone has signed up for your event!' )
	end

	def joined_reminder(joiner_email, event)
		@joiner_email = joiner_email
		@getter_email = getter_email
		mail( :to => @joiner_email,
    	:subject => 'Reminder to go to event!' )
	end
end
