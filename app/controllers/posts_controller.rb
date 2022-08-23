class PostsController < ApplicationController
    def index
        @posts = Post.select(:title, :content, :image_url, :created_at, :updated_at).order(created_at: :asc)
    end
    def create
      @post = Post.create(title: params[:title],
            content: params[:content],
            image_url: params[:image_url],
            created_at: params[:created_at],
          updated_at: params[:updated_at])
    end
    def dashboard
        @posts = Post.all.page(params[:page])
    #   @posts = Post.select(:title, :content, :image_url, :created_at, :updated_at).order(created_at: :asc)
          # @users = User.all
        # if params[:title].present?
        #     @posts = Post.where('title = ?',
        #     params[:title])
        # else
        #     # @post = Post.find_valid
        #     @posts
        # end

    end
end
