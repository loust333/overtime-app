namespace :notification do
  desc 'Sends SMS notification to employees asking them to log if they had
        overtime or not'
  task sms: :environment do
    # 1. Schedule to run at Sunday at 5pm
    # 2. Iterate over all employees
    # 3. Skip AdminUsers
    # 4. Send a message that has instructions and a link to log time
  end

  desc 'Sends Mail notification to managers each day to inform of pending
        overtime requests'
  task manager_email: :environment do
    # 1. Iterate over the list of pending overtime requests
    # 2. Check to see if there are any requests
    # 3. Iterate over the list of admin users/managers
    # 4. Send the email to each manager
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.present?
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end
