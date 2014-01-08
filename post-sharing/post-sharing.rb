require "sinatra"
require "sinatra/reloader"

get "/" do
	erb :index, :locals => {:text => "Hello, Bob Diamond"}
end