module DZero::Transmissions::Groups
  class Base
    class << self
      def parse(string)
        segments = string.split(::DZero::Constants::SEGMENT_SEPARATOR).map do |raw_segment|
          next if raw_segment.strip == ""
          ::DZero::Segments::Base.parse(raw_segment)
        end

        new(
          segments: segments
        )
      end
    end

    def initialize(segments: [])
      @segments = segments
    end

    attr_reader :segments

    def to_s
      string = ::DZero::Constants::GROUP_SEPARATOR
      string += ::DZero::Constants::SEGMENT_SEPARATOR
      string += @segments.map(&:to_s).join
      # remove the trailing segment separator, if any
      string.chomp!(::DZero::Constants::SEGMENT_SEPARATOR)
      string
    end

    def to_json(options = {})
      if options[:key_group_by_segment_sym] == true
        segments.compact.inject({}) { |memo, segment| memo.merge(segment.class.symbol => segment.to_json(options)) }
      else
        {
          segments: segments.map { |segment| segment.to_json(options) }
        }
      end
    end

    def get_segment(segment_klass)
      self.segments.detect { |s| s.is_a?(segment_klass) } || begin 
        segment = segment_klass.new({})
        self.segments << segment
        segment
      end
    end

    ::DZero::Segments::Base.segment_id_to_symbol.each do |segment_identifier, segment_name_sym|
      segment_klass = ::DZero::Segments::Base.get_klass_by_identifier(segment_identifier)
      self.send(:define_method, "#{segment_name_sym}_segment") do
        get_segment(segment_klass)
      end
    end
  end
end

require_relative './transaction_group.rb'
require_relative './transmission_group.rb'