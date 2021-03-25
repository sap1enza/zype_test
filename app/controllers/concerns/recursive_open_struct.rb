# frozen_string_literal: true

require 'ostruct'

module RecursiveOpenStruct
  def to_recursive_ostruct(hash)
    OpenStruct.new(hash.transform_values do |val|
      val.is_a?(Hash) ? to_recursive_ostruct(val) : val
    end)
  end
end
