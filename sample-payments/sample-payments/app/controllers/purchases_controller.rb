class PurchasesController < ApplicationController
	def index
	end
	def show
		@product = Product.find(params[:id])
	end
	def create
		@product = Product.find(params[:purchase][:product_id])

		customer = Stripe::Customer.create(
			:email => params[:stripeEmail],
			:card  => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer    => customer.id,
			:amount      => @product.price,
			:description => @product.title,
			:currency    => 'gbp'
		)

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to purchases_path
	end
end
