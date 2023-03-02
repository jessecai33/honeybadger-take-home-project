class Message
  attr_reader :record_type, :type, :type_code, :name, :tag, :message_stream, :description, :email, :from, :bounced_at

  def initialize(payload)
    @record_type = payload['RecordType']
    @type = payload['Type']
    @type_code = payload['TypeCode']
    @name = payload['Name']
    @tag = payload['Tag']
    @message_stream = payload['MessageStream']
    @description = payload['Description']
    @email = payload['Email']
    @from = payload['From']
    @bounced_at = payload['BouncedAt']
  end
end
