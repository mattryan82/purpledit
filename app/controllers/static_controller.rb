class StaticController < ApplicationController
  def static
    @home = Home
  #  @listposts = Post.order("created_at desc").limit(2)

  end

  # created the home method which is called when the "home_path" path/url is used
  def home
    @listposts = Post.order("created_at desc").limit(2)
  end


end
