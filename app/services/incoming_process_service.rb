class IncomingProcessService
  def self.handle(message)
    new(message).process_message
  end

  def initialize(message)
    @message = message
  end

  def process_message
    case @message.type
    when 'SpamNotification'
      forward_to_slack
    end
  end

  private

  def forward_to_slack
    PostToSlackService.forward(@message)
  end
end
