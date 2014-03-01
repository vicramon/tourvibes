module Constraint
  class LiveDomain
    def matches?(request)
      return false if request.domain == 'herokuapp.com'
      !%w(tourvibes.com localhost tourvibes.dev).include? request.domain or
        (request.subdomain.present? and request.subdomain != 'www')
    end
  end
end
