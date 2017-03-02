class HutPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      tribe_ids = TribeMember.where(user: user).pluck(:tribe_id)
      user_ids = TribeMember.where(tribe_id: tribe_ids).pluck(:user_id)
      scope.where(user_id: user_ids)
    end
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def index_by_user?
    true
  end

  def destroy?
    record.user == user
  end

  def index?
    true
  end

end
