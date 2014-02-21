module Constraint
  class Subdomain
    def self.matches?(request)
      request.subdomain.present? && request.subdomain != 'www' && request.domain != 'herokuapp.com'
    end
  end
end
