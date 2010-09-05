# http://www.devdaily.com/blog/post/ruby/using-activerecord-without-rails
# http://www.themomorohoax.com/2009/03/15/activerecord-sqlite-in-memory-db-without-rails
# http://blog.aizatto.com/2007/05/27/activerecord-migrations-without-rails/

# http://github.com/dcparker/ruby-gmail

require 'rubygems'
gem 'activerecord'
require 'yaml'

require 'activerecord'

SMS_DATA_DIR = 'sms/'

#read sms conf like file password, o2online data etc. (hidden)
passwords = YAML::load(File.open('config/passwords.yml'))

dbconf = YAML::load(File.open('config/database.yml'))  
ActiveRecord::Base.establish_connection(dbconf) 

ActiveRecord::Base.logger = Logger.new(File.open('log/database.log', 'a')) 

#check unless sms data exits?
unless File.directory? SMS_DATA_DIR
  puts "couldn't find any SMS DATA #{SMS_DATA_DIR}"
  exit
end



#for each file, 
# get parsing pattern
# parse
# put to AR
# normalize data
# save to DB (if not yet exists)

## update data
# read vcard
# check name <-> number

# display entry which need help

# get sent messages from o2online.de
# parse, save to DB
# or parse, save to file, outsurce to difernt project (likely!!)
# -> gem!!!

#find threads in between SMS e.b. if response is within 1 day!? or ask?

# connect to gmail 
# go to label
# get last timestamp??

# save sms to mail, mark as gmail saved, etc. mail id??

#ActiveRecord::Migrator.up('db/migrate')
#
#class Entry < ActiveRecord::Base
#end


# sender_name
# sender_tel
# date
# message
# mail_id
# complete??
# parent_msg_id
# 

