class Project < ActiveRecord::Base

  validates_presence_of :title, :description, :due

  belongs_to :user
  belongs_to :project_type

  has_many :submissions
  has_many :bonuses

  def bonus_score (user_id)
    score = 0
    bonuses.each do |b|
      if b.user_id == user_id
        score += b.score
      end
    end
    score
  end


  def self.find_all
    find(:all, :order => "due")
  end
end
