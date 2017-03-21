# app/policies/post_policy.rb
class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id || admin_types.include?(user.type)
  end
end
