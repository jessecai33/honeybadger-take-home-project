require 'net/http'
require 'net/https'

class PostToSlackService
  def self.forward(message)
    new(message).send_request
  end

  def initialize(message)
    @message = "Message delivered to #{message.email} was bounced as spam."
  end

  def send_request
    uri = URI("#{ENV['SLACK_API_BASE_URL']}/#{ENV['SLACK_POST_MESSAGE_ENDPOINT']}")

    # Create client
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    # Create body
    payload = {
      'channel' => "#{ENV['SLACK_CHANNEL_ID']}",
      'text' => @message
    }
    body = ActiveSupport::JSON.encode(payload)

    # Create request
    req =  Net::HTTP::Post.new(uri)
    req.add_field 'Authorization', "Bearer #{ENV['SLACK_BOT_TOKEN']}"
    req.add_field 'Content-Type', 'application/json; charset=utf-8'
    req.body = body

    # Send request
    res = http.request(req)
    puts "Response HTTP Status Code: #{res.code}"
    puts "Response HTTP Response Body: #{res.body}"
  rescue StandardError => e
    puts "Send to slack channel failed (#{e.message})"
  end

  handle_asynchronously :send_request
end
