#!/usr/bin/env ruby
require 'json'

#######################################
s3bucket="s3://your-s3-bucket/"
#######################################

message_data = JSON.parse(File.read(ARGV[0]))

message_data["message"]["attachments"].each do |attachment|
  system_file = attachment["system_file"]
  attachment = attachment["filename"]
  %x{ /usr/local/bin/aws s3 cp "#{system_file}"  #{s3bucket}}
end
