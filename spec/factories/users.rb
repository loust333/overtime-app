# spec/factories/users.rb
FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name 'Jon'
    last_name 'Snow'
    email { generate :email }
    password 'testtest'
    password_confirmation 'testtest'
    phone '3456789092'
    ssn 1234
    company 'ABC Company'
  end

  factory :admin_user, class: 'AdminUser' do
    first_name 'Admin'
    last_name 'User'
    email { generate :email }
    password 'testtest'
    password_confirmation 'testtest'
    phone '3454789592'
    ssn 1234
    company 'ABC Company'
  end

  factory :non_authorized_user, class: 'User' do
    first_name 'Non'
    last_name 'Authorized'
    email { generate :email }
    password 'testtest'
    password_confirmation 'testtest'
    phone '3437890933'
    ssn 1234
    company 'ABC Company'
  end
end
