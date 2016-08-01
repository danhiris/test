client = Aws::CloudFormation::Client.new(region: 'us-west-2')
resource = Aws::CloudFormation::Resource.new(client: client)

oudformation.create_stack({
  stack_name: "TestECMDan", # required
  template_body: "TemplateBody",
  template_url: "TemplateURL",
  parameters: [
    {
      parameter_key: "KeyPair",
      parameter_value: "deb.ecm.alfrescokey",
      use_previous_value: false,
    },
  ],
  disable_rollback: false,
  timeout_in_minutes: 1,
  notification_arns: ["NotificationARN"],
  capabilities: ["CAPABILITY_IAM"], # accepts CAPABILITY_IAM, CAPABILITY_NAMED_IAM
  resource_types: ["ResourceType"],
  on_failure: "DO_NOTHING", # accepts DO_NOTHING, ROLLBACK, DELETE
  stack_policy_body: "StackPolicyBody",
  stack_policy_url: "StackPolicyURL",
  tags: [
    {
      key: "Test",
      value: "Test",
    },
  ],
})

