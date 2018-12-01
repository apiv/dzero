module DZero::Segments
  class ResponseStatus < Base
    Base.register_segment(self, identifier: '21')

    def self.field_id_to_symbol
      super.merge({
        'AN' => :response_status,
        'F3' => :authorization_number,
        'FA' => :reject_count,
        'FB' => :reject_code,
        '4F' => :reject_field_occurrence_indicator,
        '5F' => :approved_message_code_count,
        '6F' => :approved_message_code,
        'UF' => :additional_message_information_count,
        'UH' => :additional_message_information_qualifier,
        'FQ' => :additional_message_information,
        'UG' => :additional_message_information_continuity,
        '7F' => :help_desk_phone_number_qualifier,
        '8F' => :help_desk_phone_number,
        'K5' => :transaction_reference_number,
        'A7' => :internal_control_number,
        'MA' => :url,
      })
    end
  end
end