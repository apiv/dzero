module DZero::Segments
  class Claim < Base
    Base.register_segment(self, identifier: '07')

    def self.field_id_to_symbol
      super.merge({
        'EM' => :prescription_reference_number_qualifier,
        'D2' => :prescription_reference_number,
        'E1' => :product_service_id_qualifier,
        'D7' => :product_service_id,
        'EN' => :associated_prescription_reference_number,
        'EP' => :associated_prescription_date,
        'SE' => :procedure_modifier_code_count,
        'ER' => :procedure_modifier_code,
        'E7' => :quantity_dispensed,
        'D3' => :fill_number,
        'D5' => :days_supply,
        'D6' => :compound_code,
        'D8' => :dispense_as_written_product_selection_code,
        'DE' => :date_prescription_written,
        'DF' => :number_of_refills_authorized,
        'DJ' => :prescription_origin_code,
        'NX' => :submission_clarification_code_count,
        'DK' => :submission_clarification_code,
        'ET' => :quantity_prescribed,
        'C8' => :other_coverage_code,
        'DT' => :special_packaging_indicator,
        'EJ' => :originally_prescribed_id_qualifier,
        'EA' => :originally_prescribed_code,
        'EB' => :originally_prescribed_quantity,
        'CW' => :alternate_id,
        'EK' => :scheduled_prescription_id_number,
        '28' => :unit_of_measure,
        'DI' => :level_of_service,
        'EU' => :prior_authorization_type_code,
        'EV' => :prior_authorization_number_submitted,
        'EW' => :intermediary_authorization_type_id,
        'EX' => :intermediary_authorization_id,
        'HD' => :dispensing_status,
        'HF' => :quantity_intended_to_be_dispensed,
        'HG' => :days_supply_intended_to_be_dispensed,
        'NV' => :delay_reason_code,
        'K5' => :transaction_reference_number,
        'MT' => :patient_assignment_indicator,
        'E2' => :route_of_administration,
        'G1' => :compound_type,
        'N4' => :medicade_icn,
        'U7' => :pharmacy_service_type,
      })
    end
  end
end