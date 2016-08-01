require "aws-sdk"

# An example using AWS Ruby SDK v2 to list and filter EC2 instances.
class InstanceManager

  attr_reader :ec2_resource

  # @param instance [Aws::EC2::Instance]
  # @return [String] Instance name as judged by its Name tag.
  def self.instance_name(instance)
    name_tag = instance.tags.find { |t| t.key == "Name" }
    name_tag.value if name_tag
  end

  # @param ec2_client [Aws::EC2::Client]
  # @param name_re [Regexp] Manage EC2 instance whose Name tag matches this
  # pattern.
  def initialize(ec2_client)
    @ec2_resource = Aws::EC2::Resource.new(:client => ec2_client)
  end
  def instances
    ec2_resource.instances 
  end
end

client = Aws::EC2::Client.new(:region => 'us-west-2')
manager = InstanceManager.new(client)

puts "Listing all instances"

manager.instances.each do |instance|
  name = InstanceManager.instance_name(instance)
  puts name
end
