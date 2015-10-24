require "storext/matchers/version"
require "storext/matchers/have_attribute_matcher"

module Storext
  module Matchers

    def have_attribute(name, type = nil)
      HaveAttributeMatcher.new(name, type)
    end

  end
end

require "storext/matchers/integration"
