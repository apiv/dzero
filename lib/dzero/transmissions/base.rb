require_relative './concerns/parser.rb'
require_relative './concerns/serializer.rb'
require_relative './concerns/segments_methods.rb'

module DZero::Transmissions
  class Base
    include Concerns::SegmentsMethods
    include Concerns::Serializer

    class << self
      include Concerns::Parser

      def header_schema
        raise NotImplementedError
      end
    end

    def initialize(
      header: {},
      transmission_group: Groups::TransmissionGroup.new,
      transaction_groups: [],
      segments: []
    )
      @header = header
      @transmission_group = transmission_group
      @transaction_groups = transaction_groups

      unless segments.empty?
        sort_segments(segments)
      end
    end

    attr_reader :header, :transmission_group, :transaction_groups

    def to_s
      string = ::DZero::Utils::FixedWidth.to_fixed_width(header.slice(*self.class.header_schema.keys), self.class.header_schema)
      string += ::DZero::Constants::SEGMENT_SEPARATOR
      string += transmission_group.to_s
      string += transaction_groups.map(&:to_s).join
      string
    end
  end
end

require_relative './groups/base.rb'
require_relative './request.rb'
require_relative './response.rb'
