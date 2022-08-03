class PagesController < ApplicationController
  def index
  end
  def create
    @post = Post.new(title: params[:title],
          content: params[:content],
          image_url: params[:image_url],
          created_at: params[:created_at],
        updated_at: params[:updated_at])
  end
  def dashboard
    # @posts = Post.all
    @posts = Post.select(:title, :content, :image_url, :created_at, :updated_at).order(created_at: :asc)
  end
end
