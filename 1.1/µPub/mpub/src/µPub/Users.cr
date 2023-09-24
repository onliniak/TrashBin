class App < Toro::Router
  def routes
    on "users" do
      on :nickname do
        get do
          context.response.content_type = "text/html"
          context.response.headers["Link"] = "<#{DOMAIN}:#{PORT}/auth>; rel='authorization_endpoint', <#{DOMAIN}:#{PORT}/token>; rel='token_endpoint', <#{DOMAIN}:#{PORT}/micropub>; rel='micropub_endpoint'"
          context.response.print Auth.user_views(inbox[:nickname])
          context.response.close
        end
      end
    end
  end
end
