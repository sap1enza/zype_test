# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    response = zype_api.videos(page: current_page)

    @pagination = response['pagination']
    @videos     = response['response']
    @presenters = @videos.map { |video| VideoPresenter.new(video) }
  end

  private

  def current_page
    params[:page] || 1
  end
end
