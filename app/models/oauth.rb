class Oauth
  def fetch_auth
    client.auth_code
          .authorize_url(redirect_uri: redirect_uri)
  end

  def fetch_token(code)
    client.auth_code.get_token(code, redirect_uri: redirect_uri,
                                     headers: request_headers)
  end

  private

  def request_headers
    @_request_headers ||= { 'Authorization' => 'Basic some_password' }
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
    @_headers ||= {}
  end
end
