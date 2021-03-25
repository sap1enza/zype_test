# frozen_string_literal: true

class SessionsController < ApplicationController
  def index
    redirect_to :root if authenticated?
  end

  def authenticate
    response = zype_api.authenticate!(permitted_params[:username], permitted_params[:password])

    if response.success
      session[:user_token] = response.access_token
      session[:expires_at] = response.expires_in

      redirect_to :root
    else
      @authentication_error = response.message

      render :index
    end
  end

  def destroy
    session.clear

    redirect_to :root
  end

  private

  def permitted_params
    params.permit(:username, :password)
  end
end
