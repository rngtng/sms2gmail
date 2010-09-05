# http://www.devdaily.com/blog/post/ruby/using-activerecord-without-rails
# http://www.themomorohoax.com/2009/03/15/activerecord-sqlite-in-memory-db-without-rails
require 'rubygems'
gem 'activerecord'
require 'yaml'

require 'activerecord'

#require 'zipruby'

#check unless sms data exits?
# -> extract files

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
# 

#find threads in between SMS e.b. if response is within 1 day!? or ask?



#Zip::Archive.open('sms_data.zip') do |ar|
#  n = ar.num_files # number of entries
#
#  n.times do |i|
#    file_name = ar.get_name(i) # get entry name from archive
#    
#    puts file_name
#    
#    # open entry
#    # ar.fopen(entry_name) do |f| # or ar.fopen(i) do |f|
#    #   name = f.name           # name of the file
#    #   size = f.size           # size of file (uncompressed)
#    #   comp_size = f.comp_size # size of file (compressed)
#    # 
#    #   content = f.read # read entry content
#    # end
#  end
#
#end
#
#dbconf = YAML::load(File.open('config/database.yml'))  
#ActiveRecord::Base.establish_connection(dbconf) 
#ActiveRecord::Base.logger = Logger.new(File.open('log/database.log', 'a')) 
#
#ActiveRecord::Migrator.up('db/migrate')
#
#class Entry < ActiveRecord::Base
#end