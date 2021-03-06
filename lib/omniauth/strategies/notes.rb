require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Notes < OmniAuth::Strategies::OAuth2
      option :name, :notes

      option :client_options, {
        :site => "http://u.notes18.com",
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          email: raw_info["email"]
          # and anything else you want to return to your API consumers
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/me.json').parsed
      end
    end
  end
end
