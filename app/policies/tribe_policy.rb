class TribePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
  true
  end

  def create?
  true
  end

  def update?
    record.owner == user
  end


  def destroy?
    record.owner == user
  end

end