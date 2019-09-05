class UserJoinMailer < ApplicationMailer
	default :from => 'yd2473@columbia.edu'

	def joined(email)
		@email = email
		mail( :to => @email,
    	:subject => 'Someone has signed up for your event!' )
	end
end
