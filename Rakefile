desc "Run tags for Emacs users"
task :tags do
  puts "Running tags"
  sh "ctags -e -f TAGS *.rb"
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
end
