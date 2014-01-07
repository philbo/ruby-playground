class AccountsController < ApplicationController
	def index
		@accounts = Account.all
	end
	def new
	end
	def create
		@account = Account.new(post_params)
		@account.save
		redirect_to @account
	end
	def show
		@account = Account.find(params[:id])
	end

	private
		def post_params
			params.require(:account).permit(:name, :email)
		end
end