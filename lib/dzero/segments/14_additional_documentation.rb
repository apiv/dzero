module DZero::Segments
  class AdditionalDocumentation < Base
    Base.register_segment(self, identifier: '14')

    def self.field_id_to_symbol
      super.merge({
        '2Q' => :additional_documentation_type_id,
        '2V' => :request_period_begin_date,
        '2W' => :request_period_recert_revised_date,
        '2U' => :request_status,
        '2S' => :length_of_need_qualifier,
        '2R' => :length_of_need,
        '2T' => :prescriber_supplier_date_signed,
        '2X' => :supporting_documentation,
        '2Z' => :question_number_letter_count,
        '4B' => :question_number_letter,
        '4D' => :question_percent_response,
        '4G' => :question_date_response,
        '4H' => :question_dollar_amount_response,
        '4J' => :question_numeric_response,
        '4K' => :question_alphanumeric_response,
      })
    end
  end
end