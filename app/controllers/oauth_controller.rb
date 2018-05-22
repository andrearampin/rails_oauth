class OauthController < ApplicationController
  def index; end

  def show
    AccessTokenTrace.destroy_all
    redirect_to Oauth.new.fetch_auth
  end

  def callback
    @access_token = Oauth.new.fetch_token(params[:code])
    AccessTokenTrace.create(access_token: @access_token.token)
  end
end
