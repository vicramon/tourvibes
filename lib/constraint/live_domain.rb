module Constraint
  class LiveDomain
    def matches?(request)
      !%w(tourvibes.com herokuapp.com localhost tourvibes.dev).include? request.domain or
        request.subdomain.present?
    end
  end
end
