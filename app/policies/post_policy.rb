# app/policies/post_policy.rb
class PostPolicy < ApplicationPolicy
  def update?
    # Case 1 = User of record OR Case 2 = Admin of User
    record.user_id == user.id || admin_types.include?(user.type)
  end
end
