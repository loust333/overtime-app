# app/controllers/audit_logs_controller.rb
class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all.page(params[:page]).per(10)
    authorize @audit_logs
  end
end
