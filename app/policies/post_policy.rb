class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

def index?
  true
end

  def show?
    true  
  end

  def new?
    true
  end



  def create?
    @user.is_admin
  end
end