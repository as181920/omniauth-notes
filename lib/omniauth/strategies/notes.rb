require 'omniauth'

module OmniAuth
  module Strategies
    class Notes
      include OmniAuth::Strategy

      option :fields, [:email]
      option :uid_field, :email

      uid do
        request.params[options.uid_field.to_s]
      end

      info do
        options.fields.inject({}) do |hash, field|
          hash[field] = request.params[field]
          hash
        end
      end

      def request_phase
        redirect client.auth_code.authorize_url({:redirect_uri => callback_url}.merge(options.authorize_params))
      rescue ::Timeout::Error => e
        fail!(:timeout, e)
      rescue ::Net::HTTPFatalError, ::OpenSSL::SSL::SSLError => e
        fail!(:service_unavailable, e)
      end
    end
  end
END
