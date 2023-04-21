class SessionsController < ApplicationController
    

#Login method
    def create
            user=User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id]=user.id
            render json:user
        else
            render json:{error:"Invalid Username or Password"}, status: :unauthorized
        end

    end

    #Logout method
    def destroy
        session.delete :user_id
        head :no_content
      
    end
end

