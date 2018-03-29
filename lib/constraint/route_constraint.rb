module Constraint

  class RouteConstraint

    def initialize
    end

    def matches?(request)
      not request.params[:short_url].include?('login')
    end
  end

end
