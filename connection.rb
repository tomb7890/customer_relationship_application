require 'active_record'
require 'yaml'
require 'sqlite3'
require 'logger'

conf = ENV['RAILS_ENV'] || 'default'

yamlfile = YAML::load(File.open('database.yml'))
data_base_configuration = yamlfile[conf]
ActiveRecord::Base.establish_connection(data_base_configuration)
ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'w'))
