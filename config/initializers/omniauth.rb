require File.expand_path('lib/omniauth/strategies/starladder', Rails.root)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :starladder, ENV['STRLDDR_APP_ID'], ENV['STRLDDR_APP_SECRET'], provider_ignores_state: true
end

OmniAuth.config.on_failure = proc do |env|
  SessionsController.action(:auth_failure).call(env)
end
