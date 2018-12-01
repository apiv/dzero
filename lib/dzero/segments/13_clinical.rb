module DZero::Segments
  class Clinical < Base
    Base.register_segment(self, identifier: '13')

    def self.field_id_to_symbol
      super.merge({
        'VE' => :diagnosis_code_count,
        'WE' => :diagnosis_code_qualifier,
        'DO' => :diagnosis_code,
        'XE' => :clinical_information_counter,
        'ZE' => :measurement_date,
        'H1' => :measurement_time,
        'H2' => :measurement_dimension,
        'H3' => :measurement_unit,
        'H4' => :measurement_value,
      })
    end
  end
end