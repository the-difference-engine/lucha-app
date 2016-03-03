module ApplicationHelper
	  # App's client ID. Register the app in Application Registration Portal to get this value.
  CLIENT_ID = '<e9a2b35d-7f7b-402d-8df5-85bd02ca0b41>'
  # App's client secret. Register the app in Application Registration Portal to get this value.
  CLIENT_SECRET = '<l8/RcnoFcZuWK+FbjzcLSnJgJlZucaAKsqh+JPg0am0=>'

  # Scopes required by the app
  SCOPES = [ 'openid',
             'https://outlook.office.com/mail.read' ]

  REDIRECT_URI = 'http://localhost:3000/authorize' # Temporary!

  # Generates the login URL for the app.
  def get_login_url
    client = OAuth2::Client.new(CLIENT_ID,
                                CLIENT_SECRET,
                                :site => 'https://login.microsoftonline.com',
                                :authorize_url => '/common/oauth2/v2.0/authorize',
                                :token_url => '/common/oauth2/v2.0/token')

    login_url = client.auth_code.authorize_url(:redirect_uri => REDIRECT_URI, :scope => SCOPES.join(' '))
  end
end

