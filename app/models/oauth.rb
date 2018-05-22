# frozen_string_literal: true

class Oauth
  def fetch_auth(scope: 'all')
    data = AESCrypt.new(Rails.application.config.data_token)
                   .encrypt(headers.to_json)
    client.auth_code
          .authorize_url(redirect_uri: redirect_uri, scope: scope,
                         data: data)
  end

  def fetch_token(code, scope: 'all')
    client.auth_code.get_token(code, redirect_uri: redirect_uri,
                                     headers: request_headers, scope: scope)
  end

  private

  def request_headers
    @_request_headers ||= {}
  end

  def redirect_uri
    @_redirect_uri ||= Rails.application.config.redirect_uri
  end

  def client
    @_client ||= OAuth2::Client.new(client_id, client_secret,
                                    headers.merge(site))
  end

  def site
    @_site ||= { site: Rails.application.config.site }
  end

  def client_id
    @_client_id ||= Rails.application.config.client_id
  end

  def client_secret
    @_client_secret ||= Rails.application.config.client_secret
  end

  def headers
    @_headers ||= { user: {
      br: nil, tfn: '123456782', first_name: 'Andrea', last_name: 'Pantović'
    } }
  end
end
