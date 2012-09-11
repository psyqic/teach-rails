class AddSubmissionDatetimeToSubmission < ActiveRecord::Migration
  def self.up
    add_column :submissions, :submission_datetime, :datetime
  end

  def self.down
    remove_column :submissions, :submission_datetime
  end
end
