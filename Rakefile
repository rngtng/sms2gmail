require 'yaml'

SMS_DATA_FILE = 'db/sms.pdf'; exe = 'ip'

task :default => :export

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