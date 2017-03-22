FactoryGirl.define do
  factory :post do
    user
    date Date.today
    rationale 'Some rationale'
    overtime_request 3.5
  end

  factory :second_post, class: 'Post' do
    user
    date Date.yesterday
    rationale 'Some more content'
    overtime_request 1.5
  end

  factory :post_from_other_user, class: 'Post' do
    non_authorized_user
    date Date.yesterday
    rationale 'Some more content'
    overtime_request 0.5
  end
end
