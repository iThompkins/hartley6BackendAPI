class PagesController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    def terms
    	render 'pages/terms'
    end

end