# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    Rails.cache.fetch("videos_page_#{current_page}") do
      response = zype_api.videos(page: current_page)

      @pagination = response['pagination']
      @videos     = response['response']
      @presenters = @videos.map { |video| VideoPresenter.new(video) }
    end
  end

  private

  def current_page
    params[:page] || 1
  end
end
