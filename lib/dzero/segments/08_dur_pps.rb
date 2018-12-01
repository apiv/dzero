module DZero::Segments
  class DurPps < Base
    Base.register_segment(self, identifier: '08')

    def self.field_id_to_symbol
      super.merge({
        '7E' => :dur_pps_code_counter,
        'E4' => :reason_for_service_code,
        'E5' => :professional_service_code,
        'E6' => :result_of_service_code,
        '8E' => :dur_pps_level_of_effort,
        'J9' => :dur_co_agent_id_qualifier,
        'H6' => :dur_co_agent_id,
      })
    end
  end
end