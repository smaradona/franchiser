class FranchisesController < ApplicationController

	http_basic_authenticate_with name: "beto", password: "secret"

	def index
		@franchises = Franchise.all
	end

	def show
		@franchise = Franchise.find(params[:id])
	end

	def edit
	  @franchise = Franchise.find(params[:id])
	end

	def new
	end

	def create
		@franchise = Franchise.new(franchise_params)
		if @franchise.save
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end

	def update
		@franchise = Franchise.find(params[:id])

		if @franchise.update(franchise_params)
		  redirect_to franchises_path
		else
		  render 'edit'
		end
	end

	def destroy
		@franchise = Franchise.find(params[:id])
		@franchise.destroy
		redirect_to franchises_path
	end

	private
		def franchise_params
			params.require(:franchise).permit(:owner_name, :owner_phone, :province, :zone, :address, :zip_code, :area_code, :phone_number, :owner_email, :email, :longitude, :latitude)
		end

end
