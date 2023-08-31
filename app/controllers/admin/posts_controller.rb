class Admin::PostsController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "xuxuzhe1987"

    def index
        @posts = Post.order(created_at: :desc)
        @users = User.order(created_at: :desc)
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to admin_posts_path
    end
end
