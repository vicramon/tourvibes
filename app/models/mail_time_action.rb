class MailTimeAction

  def self.url
    'http://mailtime.herokuapp.com/api/v1/actions'
  end

  def self.create(event_identifier, quantity=0, delivery_identifier)
    if event_identifier.present? && delivery_identifier.present?
      RestClient.post url, {
        delivery_identifier: delivery_identifier,
        event_identifier: event_identifier,
        quantity: quantity
      }
    end
  end

end
