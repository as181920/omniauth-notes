require 'omniauth'

module OmniAuth
  module Strategies
    class Notes < OmniAuth::Strategies::OAuth2

      option :name, :notes
      option :fields, [:email, :id]
      option :uid_field, :id

      option :client_options, {
        :site => "http://notes18.com",
        :authorize_url => "/oauth/authorize"
      }

      uid do
        request.params[options.uid_field.to_s]
      end

      info do
        options.fields.inject({}) do |hash, field|
          hash[field] = request.params[field]
          hash
        end
      end
    end
  end
end
