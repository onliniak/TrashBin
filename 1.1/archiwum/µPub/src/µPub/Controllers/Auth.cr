module IndieAuth
  def self.get_auth_code(client_id)
    code = Random::Secure.random_bytes(24).hexstring
    Model::IndieAuth.auth_code(code, client_id)
    return code
  end

  macro get_auth_route
  if context.request.method == "GET" &&
       context.request.path == "/auth"

       client_id    = context.request.query_params["client_id"]
       redirect_uri = context.request.query_params["redirect_uri"]

        if Model::IndieAuth.is_client_known?(client_id)
            redirect_server = "#{redirect_uri}?code=#{IndieAuth.get_auth_code(client_id)}&state=#{context.request.query_params["state"]}"
            context.response.headers["Location"] = redirect_server
            context.response.status_code = 302
            context.response.close
        else
              context.response.headers["Access-Control-Allow-Origin"] = *
              context.response.content_type = "text/html"
              Main.auth_views
              context.response.close
        end
    end
end

  macro post_auth_route
    if context.request.method == "POST" &&
       context.request.path == "/auth"

        body = context.request.body.not_nil!.gets_to_end # By: Kemal/param_parser
        params = HTTP::Params.parse(body)
        client_id2    = params["client_id"]
        redirect_uri2 = params["redirect_uri"]

        if client_id === client_id2 &&
           redirect_uri === redirect_uri2

            Model.read_auth_code
            context.response.content_type = "application/json"
            context.response.print %({"me": #{me}, "scope": #{scope}})
            context.response.close
        end
    end
end
end
