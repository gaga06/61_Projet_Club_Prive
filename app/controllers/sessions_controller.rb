class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
        log_in(user)
        redirect_to user_path(current_user.id)
        else
        flash.now[:danger] = 'Email et/ou mot de passe invalide'
        render 'new'
        end
    end

    def destroy
      log_out
      redirect_to home_path
    end
end
