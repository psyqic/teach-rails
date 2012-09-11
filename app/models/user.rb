class User < ActiveRecord::Base
  validates_presence_of :account_name, :first_name, :last_name, :password
  validates_uniqueness_of :account_name
  has_many :projects
  has_many :submissions
  has_many :thumbs
  has_many :bonuses

  has_and_belongs_to_many :attendances

  def bonus_score
    score = 0;
    bonuses.each do | bonus |
      score += bonus.score
    end
    score
  end

  def self.authenticate (account_name, password)
    user = self.find_by_account_name(account_name)
    if user 
      if user.password != password
        user = nil
      end
    end
    user
  end
end

