class PostsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = new_post
    @post[:ip] = request.remote_ip
    @post[:user_id] = find_or_create_user.id
    if @post.save
      render json: @post
    else
      render json: @post.errors.messages, status: 422
    end
  end

  def top
    @posts = Post.joins(:ratings).group('posts.id').order('avg(ratings.rate) desc').limit(params[:top].to_i)
    render json: @posts
  end

  def new_post
    @post = Post.new post_params
  end

  def find_or_create_user
    login = params[:login]
    if login.blank?
      create_anonymous
    else
      existing_user = User.where(login: login).first
      if existing_user.nil?
        create_user login
      else
        existing_user
      end
    end
  end

  def create_user login
    User.create login: login
  end

  def create_anonymous
    create_user User::Anonymous
  end

  def anonymous_user login
    User.create login
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
