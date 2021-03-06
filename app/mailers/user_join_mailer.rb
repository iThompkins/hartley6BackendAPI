class UserJoinMailer < ApplicationMailer
	default :from => 'theeventoapp@gmail.com'

	def joined(joiner_email, getter_email)
		@joiner_email = joiner_email
		@getter_email = getter_email
		mail( :to => @getter_email,
    	:subject => 'Someone has signed up for your event!' )
	end

	def joined_reminder(joiner_email, event)
		@joiner_email = joiner_email
		@event = event
		mail( :to => @joiner_email,
    	:subject => 'Reminder to go to event! (Be sure to add it to your GCal)' )
	end
end
