# frozen_string_literal: true

class VideoPresenter < BasePresenter
  attr_reader :video

  def initialize(video)
    @video = to_recursive_ostruct(video)
    __setobj__(@video)
  end

  def eql?(other)
    other == self || video.eql?(other)
  end

  def id
    video._id
  end
end
