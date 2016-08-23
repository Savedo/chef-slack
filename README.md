Slack Notification Cookbook
==============

This cookbook sends messages to a [Slack](http://www.slack.com) chatroom using the Incoming
Webhook Integration

Requirements
------------

#### packages
- `slack-notifier` - Uses the [slack-notifier](https://github.com/stevenosloan/slack-notifier.git)
  rubygem to talk to Slack

Attributes
----------

#### slack::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>["slack"]["webhook_url"]</tt></td>
    <td>String</td>
    <td>Your Incoming Webhook URL</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

LWRP Usage
-----
1. Add `depends 'slack'` to your `metadata.rb`
2. Add `include_recipe 'slack'` to your recipe 

Passing the below will use default attributes and default Slack channel from webhook configuration.
```ruby
slack_notify "Say Summat!"
```

Send message immediately:
```ruby
slack_notify "send_notification_message" do
  message "This is a notification message"
  webhook_url "https://hooks.slack.com/services/XXXX/XXXXXXX/XXXXXX"
  not_if { node["im_boring"] }
end
```

Or use as notifier:
```ruby
slack_notify "channel_nothing" do
  message "heres a message to kick off later"
  username "test_user"
  action :nothing
end

something "talk_as_test_user_to_multiple_channels" do
  notifies :say, "slack[channel_nothing]", :immediately
end
```

You can redefine channels and webhook URL:
```ruby
slack_notify "send_to_foo_chanel" do
  message "Important message to be sent"
  channels ["foo", "bar"]
  webhook_url "https://hooks.slack.com/services/XXXX/XXXXXXX/XXXXXX"
end
```

Also you can use attachments
```ruby
slack_notify "message_with_attachment" do
  message "Message with attachments"
  attachments [{
    color: "good",
    fields: [{
      title: "Field title",
      value: "Field value",
      short: true
    }]
  }]
end
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

Contributors
-------------------
https://github.com/Savedo/chef-slack/graphs/contributors
