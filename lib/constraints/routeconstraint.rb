module Constraint

  class RouteConstraint

    def matches?(request)
      not request.params[:arg].include?('login', 'logout')
    end

  end

end
