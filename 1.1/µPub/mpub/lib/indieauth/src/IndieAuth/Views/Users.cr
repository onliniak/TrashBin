module IndieAuthOnliniak
  def user_views(user)
    html = <<-HTML
            <!DOCTYPE html>
            <html>
              <head>
		            <link rel="authorization_endpoint" href="#{DOMAIN}:#{PORT}/auth">
		            <link rel="token_endpoint" href="#{DOMAIN}:#{PORT}/token">
		            <link rel="micropub" href="#{DOMAIN}:#{PORT}/micropub">
	            </head>
              <body>
                <div class="h-card">
                  <a class="p-name u-url"
                  href="#{Model.get_user_homepage(user)}">
                  #{Model.get_user_fullname(user)}</a> <br />
                  <img class="u-photo" src="#{Model.get_user_avatar(user)}" loading="lazy"/>
                  <span class="p-note">#{Model.get_user_bio(user)}</span>
                </div>
              </body>
              <style>
              div.h-card{margin: 4% 40% auto 20%;line-height: 6vh;}
              a.p-name.u-url{margin: auto 10%;font-weight: bolder;font-size: 3vh;}
              img.u-photo{float: left;margin:auto 5%;width: 200px;}
              </style>
            </html>
    HTML
    return html
  end
end
