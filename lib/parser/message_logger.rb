module Requests
  module MessageLogger
    def self.included(mod)
      mod.instance_exec do
        cattr_accessor :message_logger
        @@message_logger = Logger.new("#{Rails.root}/log/message.log")
      end
    end
  end
end