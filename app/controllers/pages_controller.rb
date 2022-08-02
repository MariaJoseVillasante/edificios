class PagesController < ApplicationController
  def index
  end
  def create
    @post = Post.create(title: params[:title],
          content: params[:content],
          image_url: params[:image_url],
          created_at: params[:created_at],
        updated_at: params[:updated_at])
  end
  def dashboard
    @posts = Post.all
  end
end
