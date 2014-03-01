class AddIndexForKarmaPointsToUsers < ActiveRecord::Migration
  def change
    add_index :users, :total_karma_points
  end
end
