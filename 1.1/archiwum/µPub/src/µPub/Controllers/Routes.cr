module Main
  class Routes
    include HTTP::Handler

    def call(context)
      IndieAuth.get_auth_route
      IndieAuth.get_user_route
      IndieAuth.post_auth_code
      context.response.status_code = 404
      context.response.close
    end
  end
end
