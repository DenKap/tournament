module OmniAuth
  module Strategies
    class Starladder < OmniAuth::Strategies::OAuth2
      option :name, :starladder

      option :client_options, {
        site: 'https://auth.starladder.com',
        authorize_path: 'https://auth.starladder.com/en/oauth/authorize'
      }

      uid do
        raw_info['id']
      end

      info do
        { nick: raw_info['nick'],
          email: raw_info['email']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('api/v1/me.json').parsed
      end
    end
  end
end
