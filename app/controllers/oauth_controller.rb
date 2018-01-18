class OauthController < ApplicationController
  def index; end

  def show
    redirect_to Oauth.new.fetch_auth
  end

  def callback
    @access_token = Oauth.new.fetch_token(params[:code])
  end
end
