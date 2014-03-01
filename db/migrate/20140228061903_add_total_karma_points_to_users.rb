class AddTotalKarmaPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_karma_points, :integer
  end
end
