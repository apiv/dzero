module DZero::Segments
  class Insurance < Base
    Base.register_segment(self, identifier: '04')

    def self.field_id_to_symbol
      super.merge({
        'C2' => :cardholder_id,
        'CC' => :cardholder_first_name,
        'CD' => :cardholder_last_name,
        'CE' => :home_plan,
        'FO' => :plan_id,
        'C9' => :eligibility_clarification_code,
        'C1' => :group_id,
        'C3' => :person_code,
        'C6' => :patient_relationship_code,
        'MG' => :other_payer_bin_number,
        'MH' => :other_payer_processor_control_number,
        'NU' => :other_payer_cardholder_id,
        'MJ' => :other_payer_group_id,
        '2A' => :medigap_id,
        '2B' => :medicaid_indicator,
        '2D' => :provider_accept_assignment_indicator,
        'G2' => :cms_part_d_defined_qualified_facility,
        'N5' => :medicaid_id_number,
        'N6' => :medicaid_agency_number,
      })
    end
  end
end