module Constraint
  class LiveDomain
    def matches?(request)
      !%w(tourvibes.com herokuapp.com localhost).include? request.domain
    end
  end
end
