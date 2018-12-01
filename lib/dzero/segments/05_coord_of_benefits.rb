module DZero::Segments
  class CoordOfBenefits < Base
    Base.register_segment(self, identifier: '05')

    def self.field_id_to_symbol
      super.merge({
        '4C' => :coordination_of_benefits_other_payments_count,
        '5C' => :other_payer_coverage_type,
        '6C' => :other_payer_id_qualifier,
        '7C' => :other_payer_id,
        'E8' => :other_payer_date,
        'A7' => :internal_control_number,
        'HB' => :other_payer_amount_paid_count,
        'HC' => :other_payer_amount_paid_qualifier,
        'DV' => :other_payer_amount_paid,
        '5E' => :other_payer_reject_count,
        '6E' => :other_payer_reject_code,
        'NR' => :other_payer_patient_responsibility_amount_count,
        'NP' => :other_payer_patient_responsibility_amount_qualifier,
        'NQ' => :other_payer_patient_responsibility_amount,
        'MU' => :benefit_stage_count,
        'MV' => :benefit_stage_qualifier,
        'MW' => :benefit_stage_amount,
      })
    end
  end
end