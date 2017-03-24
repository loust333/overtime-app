# app/helpers/application_helper.rb
module ApplicationHelper
  def active?(path)
    'active' if current_page?(path)
  end

  def admin_types
    ['AdminUser']
  end
end
