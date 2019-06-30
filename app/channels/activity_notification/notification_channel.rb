if defined?(ActionCable)
  class ActivityNotification::NotificationChannel < ActivityNotification.config.parent_channel.constantize
    def subscribed
      stream_from "#{ActivityNotification.config.notification_channel_prefix}_#{params['target_type']}#{ActivityNotification.config.composite_key_delimiter}#{params['target_id']}"
    end

    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  end
end
