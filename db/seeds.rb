# db/seeds.rb

@employee = Employee.create!(
  email: 'test@test.com', password: 'testtest',
  password_confirmation: 'testtest', first_name: 'Jon', last_name: 'Hollywood',
  phone: '4321567834', ssn: 1234, company: 'ABC'
)
puts '1 employee created'

@admin = AdminUser.create!(
  email: 'admin@test.com', password: 'testtest',
  password_confirmation: 'testtest', first_name: 'Admin', last_name: 'employee',
  phone: '4321563478', ssn: 1234, company: 'ABC'
)
puts '1 admin user created'

AuditLog.create!(user_id: @employee.id, status: 0,
                 start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @employee.id, status: 0,
                 start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @employee.id, status: 0,
                 start_date: (Date.today - 20.days))

puts '3 Audit Logs have been created'

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content",
               daily_hours: 12.5, user_id: @employee.id)
end

puts '100 Posts have been created'
