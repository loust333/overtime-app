# db/seeds.rb

@user = User.create(
  email: 'test@test.com',
  password: 'testtest',
  password_confirmation: 'testtest',
  first_name: 'Jon',
  last_name: 'Hollywood'
)
puts '1 user created'

@admin = AdminUser.create(
  email: 'admin@test.com',
  password: 'testtest',
  password_confirmation: 'testtest',
  first_name: 'Admin',
  last_name: 'User'
)
puts '1 admin user created'

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content",
              overtime_request: 2.5, user_id: @user.id)
end

puts '100 Posts have been created'
