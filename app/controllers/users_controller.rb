class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: user_params[:name])
        if !@user.nil? && @user != "" && user_params[:password] == user_params[:password_confirmation]
            session[:user_id] = @user.id

            redirect_to '/users/:id'
        else
            @user = User.create(user_params)
            if @user.save && user_params[:password] == user_params[:password_confirmation]
                @user = User.find_by(name: user_params[:name])
                session[:user_id] = @user.id
    
                redirect_to '/users/:id'
            else
                redirect_to 'new'
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :password_digest, :height, :nausea, :happiness, :tickets)
    end
end