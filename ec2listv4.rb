require "aws-sdk"

# An example using AWS Ruby SDK v2 to list EC2 instances.

client = Aws::EC2::Client.new(:region => 'us-west-2')
ec2_resource = Aws::EC2::Resource.new(client)
puts "Listing all instances"

ec2_resource.instances.each do |instance|
 name = instance.tags.find { |t| t.key == "Name" }
 puts name.value if name
end
