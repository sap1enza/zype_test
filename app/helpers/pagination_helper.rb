# frozen_string_literal: true

module PaginationHelper
  def previous_page?
    @pagination['previous'].present?
  end

  def next_page?
    @pagination['current'] < @pagination['pages']
  end
end
