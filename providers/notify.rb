def whyrun_supported?
  true
end

use_inline_resources

action :notify do
  webhook_url = new_resource.webhook_url || node["slack"]["webhook_url"]
  slack_notifier = Slack::Notifier.new(webhook_url)

  channels = new_resource.channels || [nil]
  allowed_options = %i(message username attachments icon_emoji icon_url)

  channels.each do |channel|
    options = {}.tap do |options|
      options[:channel] = channel

      allowed_options.each do |option|
        options[option] = new_resource.public_send(option)
      end
    end.reject { |_k, v| v.nil? }

    slack_notifier.ping(new_resource.message, options)
  end
end
