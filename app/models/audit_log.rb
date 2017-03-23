# app/models/audit_log.rb
class AuditLog < ApplicationRecord
  belongs_to :user
end
