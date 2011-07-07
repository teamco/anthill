ActiveSupport::Notifications.subscribe do |name, start, finish, id, payload|
  Rails.logger = Logger.new("#{Rails.root}/log/#{name}.log")
  Rails.logger.debug(["#{id} [#{(finish - start) * 1000}ms],", payload].join(" "))
end

DeprecationLogger = Logger.new(Rails.root.join('log/deprecations.log'))
ActiveSupport::Notifications.subscribe(/deprecation/) do |name, start, finish, id, event|
  DeprecationLogger.info("#{name}: #{start} - #{event[:message]}")
end