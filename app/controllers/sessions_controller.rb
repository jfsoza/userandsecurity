class SessionsController < ApplicationController
    def new
    end
    def create
        #check if the users exist   
        @user = User.find_by({"email"=>params["email"]})
        if @user
            #if they do check password
            #if params["password"] ==@user["password"]
            if BCrypt::Password.new(@user["password"]) ==params["password"]
            #if they do login in
            redirect_to "/companies"
            else
            redirect_to "/sessions/new"
            end
        else
             
        redirect_to "/sessions/new"
        end
        
      
        
    end

end
