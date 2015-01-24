class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  skip_before_filter :protect_from_forgery
	before_filter :allow_cors

	def allow_cors
	origin = request.headers["Origin"]
	headers['Access-Control-Allow-Origin'] = origin
	headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT, DELETE'
	allow_headers = request.headers["Access-Control-Request-Headers"]
	if allow_headers.nil?
		allow_headers = 'Origin, Authorization, Accept, Content-Type'
	end

	headers['Access-Control-Allow-Headers'] = allow_headers
	headers['Access-Control-Allow-Credentials'] = 'true'
	headers['Access-Control-Max-Age'] = '1728000'
	end
end
