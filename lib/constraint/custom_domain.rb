module Constraint
  class CustomDomain
    def self.matches?(request)
      request.domain != 'herokuapp.com' && request.domain != 'impactprep.com' && request.domain != 'localhost' && request.domain != 'tourvibes.com' && Rails.env.production?
    end
  end
end
