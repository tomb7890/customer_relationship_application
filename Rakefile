desc "Run tags for Emacs users"
task :tags do
  puts "Running tags"
  sh "ctags -e -f TAGS *.rb"
end

task :testit => [:test_schema, :test_clean, :test_populate, :test_rspec]  do
  puts "Ready for the day!"
end

task :test_schema do
  puts "Running test schema ..."
  sh 'RAILS_ENV=test ruby schema.rb '
end

task :test_clean do
  puts "Running test db:clean ..."
  sh 'RAILS_ENV=test ruby seed.rb clean'
end

task :test_populate do
  puts "Attempting to populate fixture data..."
  sh 'RAILS_ENV=test ruby lib/fixturedata.rb'
end

task :test_rspec do
  puts "Attempting to run tests..."
  sh 'RAILS_ENV=test rspec'
end



namespace :db do
  desc "Run database schema file"
  task :schema do
    puts "Running schema ..."
    ruby 'schema.rb'
  end

  desc "Run seed file to populate database"
  task :seed do
    puts "Attempting to seed data..."
    ruby 'seed.rb'
  end

  desc "clean database"
  task :clean do
    puts "Attempting to clean database..."
    ruby 'seed.rb clean'
  end
end
