teach-rails
===========

A small RoR web app  for Ruby/Ruby on Rails teachers. The app has the following features:
 - Instructors can set up an assignment with three types: a ruby script (executable), a ruby sctipt (non executable), and a Ruby on Rail app archive (tgz). 
 - Students can submit their assignement.
 - The output of ruby executables that are submitted will be displayed on its show page. 
 - Ruby on Rails app submitted can be deployed/stopped on its show page. 
 - Instructors can take attendance. :-)
That's it! 

How to use it
-------------

 1. Edit the seed data (db/seed.rb) for you class.
 2. Set up your database (config/database.yml).
 3. Rake db:migrate and rake db:seed.
 4. rails s

Disclaimer (Excuse)
-------------------

I originally created this a long time go (2010) for Rails 2 and I recently migrated it to Rails 3. So some parts may be still broken. 