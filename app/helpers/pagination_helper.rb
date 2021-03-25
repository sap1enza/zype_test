# frozen_string_literal: true

module PaginationHelper
  def previous_page?
    @pagination.dig('previous').present?
  end

  def next_page?
    @pagination.dig('current') < @pagination.dig('pages')
  end
end
