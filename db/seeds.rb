#
# Seed Data should include:
#
# 1. Your user account (role: "Instructor")
# 2. Students' accounts (role: "Student")
# 3. Project types
#

User.create(:last_name => "Inoue", :first_name =>"Keisuke", :account_name => "kinoue", :password => "password", :role => "Instructor")

ProjectType.create(:name => 'Ruby Executable', :file_extension => '.rb', :description => 'A standalone ruby programm that can be executed.')

ProjectType.create(:name => 'Rail App Archive',:file_extension => '.tgz', :description => 'A compressed archive of a Rails App.')

ProjectType.create(:name => 'Ruby Program', :file_extension => '.rb', :description => 'A ruby program that can not be executed.')

User.create(:last_name => "Cater", :first_name =>"Dee", :account_name => "dmcater", :password => "password", :role => "Student")



