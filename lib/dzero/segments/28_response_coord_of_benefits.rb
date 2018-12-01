module DZero::Segments
  class ResponseCoordOfBenefits < Base
    Base.register_segment(self, identifier: '28')

    def self.field_id_to_symbol
      super.merge({
        'NT' => :other_payer_id_count,
        '5C' => :other_payer_coverage_type,
        '6C' => :other_payer_id_qualifier,
        '7C' => :other_payer_id,
        'MH' => :other_payer_processor_control_number,
        'NU' => :other_payer_cardholder_id,
        'MJ' => :other_payer_group_id,
        'UV' => :other_payer_person_code,
        'UB' => :other_payer_help_desk_phone_number,
        'UW' => :other_payer_patient_relationship_code,
        'UX' => :other_payer_benefit_effective_date,
        'UY' => :other_payer_benefit_termination_date,
      })
    end
  end
end