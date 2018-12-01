require_relative './concerns/parser.rb'
require_relative './concerns/serializer.rb'

module DZero::Segments
  class Base
    include Concerns::Parser
    include Concerns::Serializer

    class << self
      attr_accessor :segment_id_to_symbol
      attr_accessor :segment_id_to_klass
      attr_accessor :segment_identifier
      attr_accessor :symbol

      def register_segment(klass, identifier:)
        klass.segment_identifier = identifier

        self.segment_id_to_klass[identifier] = klass
        self.segment_id_to_symbol[identifier] = klass.symbol
      end

      def field_id_to_symbol
        { 'AM' => :segment_identification }
      end

      def get_field_by_symbol(sym)
        field_id_to_symbol.invert[sym]
      end

      def get_symbol_by_field(sym)
        field_id_to_symbol[sym]
      end

      def get_klass_by_symbol(sym)
        identifier = segment_id_to_symbol.invert[sym]
        get_klass_by_identifier(identifier)
      end

      def get_klass_by_identifier(identifier)
        segment_id_to_klass[identifier] || self
      end

      def build(initial_hash = {})
        given_identifier = initial_hash[get_field_by_symbol(:segment_identification)]
        segment_klass    = segment_id_to_klass[given_identifier]
        if segment_klass
          segment_klass.new(initial_hash)
        else
          self.new(initial_hash)
        end
      end
    end

    self.segment_id_to_symbol = {}
    self.segment_id_to_klass  = {}
    self.segment_identifier   = nil

    def self.inherited(klass)
      super
      klass.symbol = klass.name.demodulize.underscore.to_sym
      klass.segment_id_to_symbol = segment_id_to_symbol
      klass.segment_id_to_klass  = segment_id_to_klass
    end

    def initialize(initial_hash = {})
      @hash = {}

      unless self.class.segment_identifier.nil?
        self[:segment_identification] = self.class.segment_identifier
      end

      self.merge(initial_hash)
    end

    attr_reader :hash

    def [](key)
      if key.is_a?(Symbol)
        key = self.class.get_field_by_symbol(key)
      end

      @hash[key]
    end

    def []=(key, value)
      if key.is_a?(Symbol)
        key = self.class.get_field_by_symbol(key)
      end

      @hash[key] = value
    end

    def merge(hash = {})
      hash.each do |key, value|
        self[key] = value
      end

      self
    end
  end
end

require_relative './01_patient.rb'
require_relative './02_pharmacy_provider.rb'
require_relative './03_prescriber.rb'
require_relative './04_insurance.rb'
require_relative './05_coord_of_benefits.rb'
require_relative './06_workers_comp.rb'
require_relative './07_claim.rb'
require_relative './08_dur_pps.rb'
require_relative './09_coupon.rb'
require_relative './10_compound.rb'
require_relative './11_pricing.rb'
require_relative './12_prior_auth.rb'
require_relative './13_clinical.rb'
require_relative './14_additional_documentation.rb'
require_relative './15_facility.rb'
require_relative './16_narrative.rb'
require_relative './20_response_message.rb'
require_relative './21_response_status.rb'
require_relative './22_response_claim.rb'
require_relative './23_response_pricing.rb'
require_relative './24_response_dur_pps.rb'
require_relative './25_response_insurance.rb'
require_relative './26_response_prior_auth.rb'
require_relative './27_response_insurance_additional_documentation.rb'
require_relative './28_response_coord_of_benefits.rb'
require_relative './29_response_patient.rb'