FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Snow'
    email 'test@test.com'
    password 'testtest'
    password_confirmation 'testtest'
  end

  factory :admin_user, class: 'AdminUser' do
    first_name 'Admin'
    last_name 'User'
    email 'admin@user.com'
    password 'testtest'
    password_confirmation 'testtest'
  end
end
