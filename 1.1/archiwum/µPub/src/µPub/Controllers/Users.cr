module IndieAuth
  macro get_user_route
  if context.request.method == "GET" &&
       context.request.path =~ /users/
              context.response.content_type = "text/html"
              context.response.headers["Link"] = "<#{DOMAIN}:#{PORT}/auth>; rel='authorization_endpoint', <#{DOMAIN}:#{PORT}/token>; rel='token_endpoint', <#{DOMAIN}:#{PORT}/micropub>; rel='micropub_endpoint'"
              Main.user_views
              context.response.close
  end
end
end
