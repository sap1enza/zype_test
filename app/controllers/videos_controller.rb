# frozen_string_literal: true

class VideosController < ApplicationController
  def show
    response = zype_api.videos(id: permitted_params[:id])

    @video = response['response'].first
    @presenter = VideoPresenter.new(@video)
  end

  private

  def permitted_params
    params.permit(:id)
  end
end
