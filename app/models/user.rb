class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  PER_PAGE = 1000

  def self.by_karma
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
    order('total_karma_points desc')
  end

  def total_karma
    # self.karma_points.sum(:value)
    self.total_karma_points
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def update_total_karma
    self.total_karma_points = karma_points.sum(:value)
    save!
  end

  def self.page(page = 1)
    offset(PER_PAGE*(page-1)).limit(PER_PAGE)
  end

end
