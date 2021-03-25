# frozen_string_literal: true

require 'recursive_open_struct'

class BasePresenter < SimpleDelegator
  include RecursiveOpenStruct
end
