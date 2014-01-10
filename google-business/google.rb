require "sinatra"
require "sinatra/reloader"
require "json"
require "sinatra/config_file"

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

config_file 'config/settings.yml'

api = GooglePlacesAPI.new(settings.api_key)

get "/" do
	erb :index
end

post "/search" do
	results = api.autocomplete(:query => { :types => "establishment", :input => params["g-search-text"] })
	results.to_json
end

get "/details" do
	results = api.details(:query => { :reference => params["reference"] })
	results.to_json
end