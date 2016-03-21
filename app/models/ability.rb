class Ability
  include CanCan::Ability

  def initialize(user)

    if user.admin?
      #Grant all permissions on all models on the aplication
      can :manage, :all
    else
      can :update, Article do |article|
        article.user == user
      end

      can :destroy, Article do |article|
        article.user == user
      end

      can :destroy, Comment do |comment|
        comment.user == user
      end

      can :create, Article
      can :create, Comment
    end
  end
end
