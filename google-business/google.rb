require "sinatra"
require "sinatra/reloader"
require "json"

set :public_folder, 'public'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

get "/" do
	erb :index
end

post "/search" do
	api = GooglePlacesAPI.new()
	results = api.autocomplete(:query => { :types => "establishment", :input => params["g-search-text"] })
	results.to_json
end

get "/details" do
	api = GooglePlacesAPI.new()
	results = api.details(:query => { :reference => params["reference"] })
	results.to_json
end