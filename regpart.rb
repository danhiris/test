#!/usr/bin/env ruby

require 'rubygems'
require 'aws-sdk'


aws = Aws.partition('aws')

puts "Regions available in the aws partition:\n"
aws.regions.each do |region|
  puts region.name
end

puts "Services available in the aws partition:\n"
aws.services.each do |services|
  puts services.name
end
