class StaticController < ApplicationController
  def static
    @home = Home
    @posts = Post.order("created_at desc").limit(2)

  end
end
