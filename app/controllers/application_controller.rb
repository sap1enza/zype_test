# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  private

  def zype_api
    Api::ZypeService.new(current_user_token)
  end
end
