class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		if resource.is_a?(Staff)
      		staffs_root_path
    	else
      		root_path
    	end
  	end

	def after_sign_out_path_for(resource)
		if resource == :staff
      		new_staff_session_path
    	else
      		root_path
    	end
	end

end
