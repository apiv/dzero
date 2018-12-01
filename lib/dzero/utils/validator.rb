require 'dzero'
require 'classy_hash'

module DZero::Utils
  class Validator
    # Due to the way classy_hash is written, it cannot be extended conventionally
    CHExtended = CH.dup
    CHExtended.module_eval do
      def self.join_path(parent_path, key)
        if parent_path
          parent_path + [key]
        elsif key == CH::NO_VALUE
          nil
        else
          [key]
        end
      end
    end

    class << self
      def eq(expected)
        Proc.new { |value| expected == value || "must be #{expected}" }
      end
    end

    def initialize(transmission, validations)
      @transmission = transmission
      @validations  = validations
    end

    attr_reader :transmission, :validations

    def validate
      @errors = []

      CHExtended.validate(hash, validations, errors: @errors, raise_errors: false, full: true)
    end

    def readable_errors
      @errors.map do |error|
        error[:message] = 'must be present' if error[:message] == 'present'

        case error[:full_path][0]
        when :header
          "Transaction Header: #{error[:full_path][1]} #{error[:message]}"
        when :transmission_group
          "#{error[:full_path][1].to_s.titlecase} Segment: #{error[:full_path][2]} #{error[:message]}"
        when :transaction_groups
          next unless error[:full_path][2]
          "Group #{error[:full_path][1]}, #{error[:full_path][2].to_s.titlecase} Segment: #{error[:full_path][3]} #{error[:message]}"
        else
          "#{error[:full_path][-1]} #{error[:message]}"
        end.to_s.strip.squeeze(' ')
      end.compact
    end

    def hash
      @hash ||= transmission.to_json(readable: true, key_group_by_segment_sym: true)
    end
  end
end