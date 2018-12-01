module DZero::Segments
  class ResponseDurPps < Base
    Base.register_segment(self, identifier: '24')

    def self.field_id_to_symbol
      super.merge({
        'J6' => :dur_pps_response_code_counter,
        'E4' => :reason_for_service_code,
        'FS' => :clinical_significance_code,
        'FT' => :other_pharmacy_indicator,
        'FV' => :quantity_of_previous_fill,
        'FU' => :previous_date_of_fill,
        'FW' => :database_indicator,
        'FX' => :other_prescriber_indicator,
        'FY' => :dur_free_text_message,
        'NS' => :dur_additional_text,
      })
    end
  end
end