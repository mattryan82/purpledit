class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
    
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