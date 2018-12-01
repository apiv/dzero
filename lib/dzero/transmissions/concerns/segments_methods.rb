module DZero::Transmissions::Concerns
  module SegmentsMethods
    TRANSMISSION_LEVEL_SEGMENTS = [
      :patient,
      :insurance,
      :response_message,
      :response_insurance,
      :response_patient,
    ]

    TRANSACTION_LEVEL_SEGMENTS = [
      :pharmacy_provider,
      :prescriber,
      :coord_of_benefits,
      :workers_comp,
      :claim,
      :dur_pps,
      :coupon,
      :compound,
      :pricing,
      :prior_auth,
      :clinical,
      :additional_documentation,
      :facility,
      :narrative,
      :response_status,
      :response_claim,
      :response_pricing,
      :response_dur_pps,
      :response_prior_auth,
      :response_additional_documentation,
      :response_coord_of_benefits
    ]

    def self.included(base)
      ::DZero::Segments::Base.segment_id_to_symbol.each do |segment_identifier, segment_name_sym|
        segment_klass = ::DZero::Segments::Base.get_klass_by_identifier(segment_identifier)
        base.send(:define_method, "#{segment_name_sym}_segment") do
          get_segment(segment_klass)
        end
      end
    end

    def get_segment(segment_klass)
      self.transmission_group.segments.detect { |s| s.is_a?(segment_klass) } || 
      self.transaction_groups.first.segments.detect { |s| s.is_a?(segment_klass) } ||
      begin
        segment = segment_klass.new({})
        self.segments << segment
        segment
      end
    end

    def sort_segments(segments)
      segments.each do |segment|
        segment_sym = segment.class.symbol
        if TRANSMISSION_LEVEL_SEGMENTS.include?(segment_sym)
          transmission_group.segments << segment
        else
          if transaction_groups.empty?
            transaction_groups << ::DZero::Transmissions::Groups::TransactionGroup.new({ segments: [] })
          end

          transaction_groups.first.segments << segment
        end
      end
    end

    def segments
      all = []
      all += transmission_group.segments
      all += transaction_groups.map(&:segments).flatten
      all.compact
    end
  end
end