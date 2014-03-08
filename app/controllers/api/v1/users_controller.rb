class Api::V1::UsersController < ApplicationController
	respond_to :json

	def createActivity
		if current_user

			#################################################
			# might want to limit params for security later #
			#################################################
			params.permit!


			act_json = params[:activity]
			act_json[:host_id] = current_user.id
			act = Activity.new(act_json)
			if act.save
				atd = Attendee.new(:user_id => current_user.id, :activity_id => act.id, :role => "host")
				if atd.save
					render :status => 200,
			           :json => { :success => true,
			                      :info => "Logged in",
			                      :data => act }
			  else
			  	render :status => 401,
		           :json => { :success => false,
		                      :info => "activity relation failed to save"}
		    end
		  end
		else
			render :status => 401,
		           :json => { :success => false,
		                      :info => "user not signed in"}
		end

	end



	def myActivities
		ids = Attendee.find(:all, :conditions => {:user_id => current_user.id}).map(&:activity_id)
		render :status => 200,
	           :json => { :success => true,
	                      :info => "activites!",
	                      :data => Activity.find(:all,
	                      	:conditions => {:id => ids}) }
	                      # :data => current_user.activites}
	end

	# def user_params
 #    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
 #  end

end
