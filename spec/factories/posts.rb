FactoryGirl.define do
  factory :post do
    user
    date Date.today
    rationale 'Some rationale'
    daily_hours 12.5
  end

  factory :second_post, class: 'Post' do
    user
    date Date.yesterday
    rationale 'Some more content'
    daily_hours 8.0
  end

  factory :post_from_other_user, class: 'Post' do
    non_authorized_user
    date Date.yesterday
    rationale 'Some more content'
    daily_hours 0.5
  end
end
