class TrailPolicy < ApplicationPolicy
  class Scope < Scope

     def resolve
       scope.all
     end
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def create?
    true
  end

  def new?
    true
  end

  def show?
    true
  end

end
