class AddSubmissionDateToSubmission < ActiveRecord::Migration
  def self.up
    add_column :submissions, :submission_date, :datetime
  end

  def self.down
    remove_column :submissions, :submission_date
  end
end
