class Thumb < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission
end
