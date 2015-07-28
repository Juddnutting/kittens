class KittensController < ApplicationController

	def index
		@kittens = Kitten.all

	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def new
		@kitten = Kitten.new
		@range_options = (1..10)
	end

	def create
		@kitten = Kitten.create(kitten_params)
		if @kitten.save
			flash[:success] = "Kitten Created"
			redirect_to @kitten
		else
			render 'new'
		end
	end

	private

		def kitten_params
			params.require(:kitten).permit(:name, :age, :cuteness, :softness)

		end
end
