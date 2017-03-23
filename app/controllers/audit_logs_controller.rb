# app/controllers/audit_logs_controller.rb
class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all
    authorize @audit_logs
  end
end
