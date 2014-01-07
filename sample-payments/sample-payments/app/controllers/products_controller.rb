class ProductsController < ApplicationController
	def index
		@products = Product.all
	end
	def new
	end
	def create
		@product = Product.new(post_params)
		@product.save
		redirect_to @product
	end
	def show
		@product = Product.find(params[:id])
	end

	private
		def post_params
			params.require(:product).permit(:title, :price)
		end
end
