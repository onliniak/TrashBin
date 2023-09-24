module Main
  macro auth_views
{% begin %}
html = <<-HTML
        <html>
            <div style="padding: 5% 30% 5% 15%">
                <div>
                <div style="width: 72px;height: 72px;border: double">
                <img>
                </div>

                Allow <a href="#{context.request.query_params["client_id"]}">title</a> access to #{context.request.query_params["me"]}?

                <a href="#{context.request.query_params["redirect_uri"]}?code=#{IndieAuth.get_auth_code(context.request.query_params["client_id"])}&state=#{context.request.query_params["state"]}">YES</a>
                <br />
                <a href="#{context.request.query_params["client_id"]}">NO</a>
                </div>

            <div style="float: right">
            #{context.request.query_params["scope"]?}
            </div>
            </div>
            <script async>
            fetch("#{context.request.query_params["client_id"]}")
            .then(response => response.text())
            .then(data => function get_website_info(data) {
                logo = data.querySelector(".h-x-app img.u-logo").src ||
                data.querySelector(".h-app img.u-logo").src;

                title = data.querySelector(".h-x-app .p-name").inner_text ||
                data.querySelector(".h-app .p-name").inner_text ||
                data.querySelector(".h-x-app .p-name").alt ||
                data.querySelector(".h-app .p-name").alt;

                data.querySelector("html body div div div img").src = logo;
                data.querySelector("html body div div a").inner_text = title
            })
            </script>
        </html>
    HTML
    context.response.print html
{% end %}
end
end
