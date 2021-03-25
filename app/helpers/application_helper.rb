# frozen_string_literal: true

module ApplicationHelper
  def current_user_token
    session[:user_token]
  end

  def authenticated?
    current_user_token.present?
  end
end
