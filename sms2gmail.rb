# http://www.devdaily.com/blog/post/ruby/using-activerecord-without-rails
# http://www.themomorohoax.com/2009/03/15/activerecord-sqlite-in-memory-db-without-rails
# http://blog.aizatto.com/2007/05/27/activerecord-migrations-without-rails/

# http://github.com/dcparker/ruby-gmail

require 'rubygems'
#gem 'activerecord'
require 'yaml'

#require 'ruby-debug'
#require 'active_record'

SMS_DATA_DIR = 'sms/'

#require 'patterns'
#read sms conf like file password, o2online data etc. (hidden)
#passwords = YAML::load(File.open('config/passwords.yml'))

#dbconf = YAML::load(File.open('config/database.yml'))
#ActiveRecord::Base.establish_connection(dbconf)

#ActiveRecord::Base.logger = Logger.new(File.open('log/database.log', 'a'))

#check unless sms data exits?
unless File.directory? SMS_DATA_DIR
  puts "couldn't find any SMS DATA #{SMS_DATA_DIR}"
  exit
end

#include Patterns

#for each file,
# Dir['sms/*'].each do |file|
#   puts file
#   pattern = PATTERNS[file.gsub('sms/')]
#
#   file = File.open(file)
#   body = Array(file.lines).join('')
#   debugger
#   #puts body.scan(pattern)
#
# #   body
#   exit
# end


sms_cfg = YAML::load(File.open('config/sms.yml'))

sms_cfg.map do |file_name, cfg|
  SMS::parse(file_name, cfg)
end

class SMS

  def self.parse(file_name, cfg = {})
    content = Array(File.open("sms/#{file_name}").lines).join
    pattern = Regexp.new cfg[:pattern]

    content.scan(pattern).map do |sms_data|
      self.new(cfg[:fields], sms_data)
    end
  end  


  def initialize(fields, data)
    @d = {}
    fields.each do |field, key|
      @d[field] = data[key] || key if data[key] || string?(key)
    end
  end

  def to_s
    %w(sender_name sender_nr date text).map do |c|
      @d[c]
    end.join('|')
  end
  
  private
  def string?(str)
    str.to_i.to_s == str
  end

end


# PATTERNS.keys.each do |file_name, pattern|
#   puts file_name
#   file = File.open("sms/#{file_name}")
#   body = Array(file.lines).join('')
#   body.scan(pattern.last).each do |sms_data|
#     s = SMS.new(pattern.first, sms_data)
#     puts s.to_s
#   end
#   exit
# end

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
# receiver_name
# receiver_tel
# date
# message
# mail_id
# source
# complete??
# parent_msg_id
#

