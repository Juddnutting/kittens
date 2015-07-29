class KittensController < ApplicationController

	def index
		@kittens = Kitten.all

		respond_to do |format|
			format.html
			format.json { render :json => @kittens} 
		end

	end

	def show
		@kitten = Kitten.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render :json => @kitten}
		end
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

	def edit
		@kitten = Kitten.find(params[:id])
		@range_options = (1..10)
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update(kitten_params)
			flash[:succes] = "Kitten updated"
			redirect_to @kitten
		else
		redirect_to root_url
		end
	end

	def destroy
		Kitten.find(params[:id]).destroy
		flash[:succes] = "Kitten deleted"
		redirect_to root_url
	end

	private

		def kitten_params
			params.require(:kitten).permit(:name, :age, :cuteness, :softness)

		end
end
