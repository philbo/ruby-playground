require "sinatra"
require "sinatra/reloader"
require "koala"
require "json"

set :public_folder, 'public'

get "/" do
	if params[:oauth_access_token]
		begin
			@graph = Koala::Facebook::API.new(params[:oauth_access_token])

			@fb_feed = @graph.get_connections("me", "feed")

			erb :index, :locals => {:text => "Hello, Bob Diamond"}
		rescue => exception
	  		return exception.to_s
		end
	end

	erb :index, :locals => {:text => "Hello, Bob Diamond"}
end

post "/share" do
	oauth_access_token = params["sharing-authtoken"]
	text_to_post = params["sharing-text"]

	begin
		@graph = Koala::Facebook::API.new(oauth_access_token)

		response = @graph.put_connections("me", "feed", :message => text_to_post)

		redirect to("/?oauth_access_token=#{oauth_access_token}")
	rescue => exception
  		return exception.to_s
	end
end