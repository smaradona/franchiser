class FranchisesController < ApplicationController

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

	def index
		@franchises = Franchise.all
	end

	def show
		@franchise = Franchise.find(params[:id])
	end

	private
		def franchise_params
			params.require(:franchise).permit(:owner_name, :owner_phone, :province, :zone, :address, :zip_code, :area_code, :phone_number)
		end

end
