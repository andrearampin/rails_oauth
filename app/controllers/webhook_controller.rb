# frozen_string_literal: true

class WebhookController < ApplicationController
  protect_from_forgery except: :create

  def create
    puts params
  end
end
