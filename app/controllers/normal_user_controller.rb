class NormalUserController < ApplicationController
	before_action :authorize, except: :new
	def new
	end
	def show
		#render json: {msg:params} 
		@article=Normaluser.find(params[:id])
		#render json: {msg:@article}
	end
	def create
		#render json: {msg: normal_user_params}
		# @user = Normaluser.create('name' => params[:normal_user][:name],
  #                  'password' => params[:normal_user][:password],
  #                  'email' => params[:normal_user][:email],
		# 			'accounttype' => params[:normal_user][:accounttype],
  #                  'phonenumber' => params[:normal_user][:phonenumber],
  #                  'status' => params[:normal_user][:status])
  		@user=Normaluser.new(normal_user_params)
		if @user.save

			render json: {msg:@user}
		else
			render json:{msg:"could not insert data"}
		end

	end

	def editbar
		#render json: {msg: params}
		$cnt=params[:id]
		@user1=Normaluser.find(params[:id])
		#render json: {msg: @user1}
	end
	def update
		#render json: {msg: params}
		@user = Normaluser.find($cnt)
 		#render json: {msg: params}
    	if @user.update(update_params)
    	
      		redirect_to controller: 'normal_user', action: 'show', id: @user.id
    	else
      		render json:{msg: "could not update it"}
    	end
	end
	private
	def normal_user_params
    		params.require(:normaluser).permit(:name, :password,:email,:accounttype,:phonenumber,:status)
  	end
  	def update_params
  		    params.permit(:name, :password,:email,:accounttype,:phonenumber,:status)

  	end
end
