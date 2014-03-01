namespace :calculate do
  desc "calculate karma points for user already in db"
  task :total_karma_points => :environment do
    User.find_each do |user|
      user.update_attribute(:total_karma_points, user.karma_points.sum(:value))
    end
  end

end
