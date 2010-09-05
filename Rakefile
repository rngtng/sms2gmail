require 'active_record'
require 'yaml'

SMS_DATA_FILE = 'db/sms.pdf'; exe = 'ip'

task :default => :migrate

desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
task :migrate => :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end

task :environment do
  ActiveRecord::Base.establish_connection(YAML::load(File.open('database.yml')))
  ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))
end

desc "export SMS Data with given password"
task :export do
  #delete old one
  `[[ -s #{SMS_DATA_FILE} ]] && rm #{SMS_DATA_FILE}`
  
  #create new one with encrypted password
  `z#{exe} -P #{get_data_password} #{SMS_DATA_FILE} sms/*`
end

desc "unpdf SMS Data with given password"
task :import do
  `unz#{exe} -P #{get_data_password} #{SMS_DATA_FILE}`
end


def get_data_password
  YAML::load(File.open('config/passwords.yml'))['file']['password']
end