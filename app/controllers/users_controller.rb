class UsersController < ApplicationController
	

	def index
		@user = User.all
	end

	def show
    	@user = User.find(params[:id])
  	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
      		if @user.save
        		format.html { redirect_to @user, notice: 'User was successfully created.' }
	        	format.json { render :show, status: :created, location: @user }
	      	else
	        	format.html { render :new }
	        	format.json { render json: @user.errors, status: :unprocessable_entity }
	      	end
	    end

	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
	    	if @user.update(user_params)
	        	format.html { redirect_to @user, notice: 'User was successfully updated.' }
	        	format.json { render :show, status: :ok, location: @user }
	      	else
	        	format.html { render :edit }
	        	format.json { render json: @user.errors, status: :unprocessable_entity }
	      	end
	    end

	end

	def destroy
		@user = User.find(params[:id])
  		@user.destroy
  		respond_to do |format|
	      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
	      format.json { head :no_content }
	    end
  	end

  	def user_with_most_tickets
  		max = 0
  		for u in User.all do
  			contador = 0
  			for o in Order.all do
  				if o[:user_id] == u[:id]
  					for t in Ticket.all do
  						if o[:id] == t[:order_id]
  							contador += 1
  						end
  					end
  				end
  			end
  			if contador >= max
  				max = contador
  				@user = u
  			end
  		end
  	end

	private
  		def user_params
    		params.require(:user).permit(:name, :lastname, :email, :password, :address)
  		end
end
