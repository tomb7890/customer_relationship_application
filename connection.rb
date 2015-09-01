require "active_record"
require "yaml"
require "sqlite3"
require "logger"

conf = 'default'
rails_env = ENV['RAILS_ENV']

ARGV.each do |a|
  elements = a.split("=")
  if elements[0] == 'ENV'
    conf = elements[1]
  end
end

if not rails_env.empty?
  conf = rails_env
end

yamlfile = YAML::load(File.open('database.yml'))
data_base_configuration = yamlfile[conf]
ActiveRecord::Base.establish_connection(data_base_configuration)
ActiveRecord::Base.logger = Logger.new(File.open("database.log", "w"))
