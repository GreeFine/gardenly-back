namespace :statistics do
  task :fetch => :environment do
    statistic = Statistic.create!(
      users_count: User.count,
      media_count: Medium.count,
      gardens_count: Garden.count,
    )
    statistic.save!
  end
end
