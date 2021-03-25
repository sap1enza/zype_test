# frozen_string_literal: true

class VideosController < ApplicationController
  def show
    Rails.cache.fetch("video_#{permitted_params[:id]}") do
      response = zype_api.videos(id: permitted_params[:id])

      @video = response['response'].first
      @presenter = VideoPresenter.new(@video)
    end
  end

  private

  def permitted_params
    params.permit(:id)
  end
end
