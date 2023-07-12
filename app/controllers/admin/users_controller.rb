class Admin::UsersController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "xuxuzhe1987"

    def index
        @users = User.all
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_users_path
    end
end
