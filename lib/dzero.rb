require 'active_support'
require 'active_support/core_ext'

module DZero
  module Constants
    FIELD_SEPARATOR   = "\x1C"
    GROUP_SEPARATOR   = "\x1D"
    SEGMENT_SEPARATOR = "\x1E"
  end

  module Segments
    module Concerns; end
  end

  module Transmissions
    module Concerns; end
    module Groups; end
  end

  module Utils; end
end

require 'dzero/utils/fixed_width.rb'
require 'dzero/utils/rejection_codes.rb'
require 'dzero/utils/validator.rb'
require 'dzero/segments/base.rb'
require 'dzero/transmissions/base.rb'

