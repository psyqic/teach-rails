class CreateAttendancesUsers < ActiveRecord::Migration
  def self.up
    create_table :attendances_users, :id => false do |t|
      t.integer :attendance_id
      t.integer :user_id

    end
  end

  def self.down
    drop_table :attendances_users
  end
end
