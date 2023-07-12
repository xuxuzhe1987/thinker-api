class Api::V1::PostsController < Api::V1::BaseController
  # skip_before_action :verify_authenticity_token
  # skip_before_action :verify_request
  before_action :set_post, only: [ :show, :destroy ]

  def index
    @posts = Post.order(created_at: :desc).all
    @my_posts = Post.where(open_id: @current_user.open_id).order(created_at: :desc).all
    @my_likes = Like.where(user_id: @current_user.id).pluck(:post_id)
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    @post.rate = 0
    content = @post.body
    checking_res = message_check(content)
    if checking_res["errcode"] == 0
      if @post.save
        render :show, status: :created
      else
        render_error
      end
    else
      render json: checking_res
    end
  end

  def destroy
    @post.destroy
  end

  def like
    @post = Post.find(params[:id])
  
    # 使用悲观锁来获取并锁定 @post 记录
    @post.with_lock do
      # 检查当前用户是否已经点过赞
      if @post.liking_users.exists?(@current_user.id)
        render json: { error: '赞过啦～' }, status: :unprocessable_entity
      else
        # 创建一个新的点赞记录
        like = @post.likes.new(user: @current_user)
        if like.save
          @post.increment!(:rate) # 增加点赞数
          render json: { message: '👍 +1' }
        else
          render_error
        end
      end
    end
  end
  
  private

  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:nickname, :avatarUrl, :open_id, :body)
  end

  def render_error
    render json: { errors: @post.errors.full_messages },
    status: :unprocessable_entity
  end

end