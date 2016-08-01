#!/usr/bin/env ruby

require 'rubygems'
require 'aws-sdk'


ec2 = Aws::EC2::Resource.new()

ec2.instances.each do |instance|

  puts instance

end

