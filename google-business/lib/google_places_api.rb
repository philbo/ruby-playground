require "httparty"

class GooglePlacesAPI
	include HTTParty
	
	base_uri 'https://maps.googleapis.com/maps/api/place'
	default_params :sensor => "false"

	def initialize()
		self.class.default_params :key => "AIzaSyDO5wsQu2uuJrSblYlg0lwtWQ7ngLf0jn4"
	end

	def autocomplete(options={})
		#raise ArgumentError, 'You must search for something' if options[:query].blank?
		self.class.get("/autocomplete/json", options)
	end

	def details(options={})
		#raise ArgumentError, 'You must search for something' if options[:query].blank?
		self.class.get("/details/json", options)
	end
end