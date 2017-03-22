FactoryGirl.define do
  factory :post do
    user
    date Date.today
    rationale 'Some rationale'
  end

  factory :second_post, class: 'Post' do
    user
    date Date.yesterday
    rationale 'Some more content'
  end

  factory :post_from_other_user, class: 'Post' do
    non_authorized_user
    date Date.yesterday
    rationale 'Some more content'
  end
end
