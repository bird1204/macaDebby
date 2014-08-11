class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities


  #  使用方式
  # user == current_user
  # 賦予授權的格式 : "can :action, Model"
  # 可以對什麼Model做哪些controller的action?

  # + + + + + + + + + + + + + + + + +
  # 權限命名規則 "(主詞)物件名稱-動詞-補語"
  # + + + + + + + + + + + + + + + + +

  # Ex : 可以發文如何定義 ?
  #
  # Ans:
  # In Ability
  # can :create, Article          => 定義 Ability 的授權
  #
  # In Controller
  # authorize! :create, Article   => 跑去 Ability 檢查是否有權限

  # 可以把很多action一起做一個命名就好嗎? 不然寫判斷很累
  # Ans:
  # 請參考 : https://github.com/ryanb/cancan/wiki/defining-abilities
  # alias_action :create, :read, :update, :destroy, :to => :crud
    user ||= User.new # guest user (not logged in)
    if user.is_god? (:GOD)
        p "rifjrqhiugiqpuwhgqpiuh"
      can :manage, :all
    else
      can :read, :all
    end
  end

  def is_god?
    true if current_employee.role == "GOD"
  end

  def has_role?(role)
    true if current_employee.role == "#{role}"
  end

end
