# spec/features/post_spec.rb
require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }

  let(:post) do
    Post.create(date: Date.today, rationale: 'asdf', user_id: user.id,
                daily_hours: 3.5)
  end

  before do
    login_as(user, scope: :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of Posts' do
      post = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      # TODO: Refactor
      post2.update(user_id: user.id)
      post.update(user_id: user.id)
      visit posts_path
      expect(page).to have_content(/rationale|content/)
    end

    it 'has a scope so that only posts creators can see their posts' do
      other_user =
        User.create(first_name: 'Non', last_name: 'Authorized',
                    email: 'non_authorized_user@test.com', password: 'testtest',
                    password_confirmation: 'testtest', phone: '555555555')
      Post.create(date: Date.today, rationale: 'This post shouldnt be seen',
                  daily_hours: 3.5, user_id: other_user.id)

      expect(page).to_not have_content(/This post shouldnt be seen/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      employee =
        Employee.create(first_name: 'Employee', last_name: 'Authorized',
                        email: 'employee@test.com', password: 'testtest',
                        password_confirmation: 'testtest', phone: '555455555')
      login_as(employee, scope: :user)
      visit root_path
      click_link('new_post_from_nav')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      logout(:user)

      delete_user = FactoryGirl.create(:user)
      login_as(delete_user, scope: :user)

      post_to_delete = Post.create(date: Date.today, rationale: 'test',
                                   daily_hours: 3.5,
                                   user_id: delete_user.id)

      visit posts_path

      click_link "delete_post_#{post_to_delete.id}_from_index"
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      fill_in 'post[daily_hours]', with: 4.5

      expect { click_on 'Save' }.to change(Post, :count).by(1)
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User_Association'
      fill_in 'post[daily_hours]', with: 4.5
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User_Association')
    end
  end

  describe 'edit' do
    it 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on 'Save'

      expect(page).to have_content('Edited content')
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)

      visit edit_post_path(post)
      expect(current_path).to eq(root_path)
    end
  end
end
