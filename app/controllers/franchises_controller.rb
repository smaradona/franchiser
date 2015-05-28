class FranchisesController < ApplicationController

	before_action :logged_in_user

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

	def logged_in_user
	  unless logged_in?
		flash[:danger] = "Please log in."
		redirect_to login_url
	  end
	end
	def franchise_params
		params.require(:franchise).permit(:owner_name, :owner_phone, :province, :zone, :address, :zip_code, :area_code, :phone_number, :owner_email, :email, :longitude, :latitude, :area)
	end

end
