module Archipelag
  class ApplicationController
    def initialize(context : HTTP::Server::Context)
      @response : HTTP::Server::Response = context.response
      @request : HTTP::Request = context.request
    end

    # https://guides.rubyonrails.org/routing.html#crud-verbs-and-actions
    macro index(classname = "/" + self.name[12..-11].downcase, &block)
      {% begin %}
        get {{classname}} do
          {{yield block}}
        end
      {% end %}
    end

    macro new(classname = "/" + self.name[12..-11].downcase + "/new", &block)
      {% begin %}
        get {{classname}} do
          {{yield block}}
        end
      {% end %}
    end

    macro create(classname = "/" + self.name[12..-11].downcase, &block)
      {% begin %}
        post {{classname}} do
          {{yield block}}
        end
      {% end %}
    end

    macro show(id, classname = "/" + self.name[12..-11].downcase + "/" + id, &block)
      {% begin %}
        get {{classname}} do
          {{yield block}}
        end
      {% end %}
    end

    macro edit(id, classname = "/" + self.name[12..-11].downcase + "/" + id + "/edit", &block)
      {% begin %}
        get {{classname}} do
          {{yield block}}
        end
      {% end %}
    end

    macro update(id, classname = "/" + self.name[12..-11].downcase + "/" + id, &block)
      {% begin %}
        put {{classname}} do
          {{yield block}}
        end
      {% end %}
    end

    macro destroy(id, classname = "/" + self.name[12..-11].downcase + "/" + id, &block)
      {% begin %}
        delete {{classname}} do
          {{yield block}}
        end
      {% end %}
    end
  end
end
