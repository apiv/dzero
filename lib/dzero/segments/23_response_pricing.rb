module DZero::Segments
  class ResponsePricing < Base
    Base.register_segment(self, identifier: '23')

    def self.field_id_to_symbol
      super.merge({
        'F5' => :gross_amount_due, # :patient_pay_amount
        'F6' => :ingredient_cost_paid,
        'F7' => :dispensing_fee_paid,
        'AV' => :tax_exempt_indicator,
        'AW' => :flat_sales_tax_amount_paid,
        'AX' => :percentage_sales_tax_amount_paid,
        'AY' => :percentage_sales_tax_rate_paid,
        'AZ' => :percentage_sales_tax_basis_paid,
        'FL' => :incentive_amount_paid,
        'J1' => :professional_service_fee_paid,
        'J2' => :other_amount_paid_count,
        'J3' => :other_amount_paid_qualifier,
        'J4' => :other_amount_paid,
        'J5' => :other_payer_amount_recognized,
        'F9' => :total_amount_paid,
        'FM' => :basis_of_reimbursement_determination,
        'FN' => :amount_attributed_to_sales_tax,
        'FC' => :accumulated_deductible_amount,
        'FD' => :remaining_deductible_amount,
        'FE' => :remaining_benefit_amount,
        'FH' => :amount_applied_to_periodic_deductible,
        'FI' => :amount_of_copay,
        'FK' => :amount_exceeding_periodic_benefit_maximum,
        'HH' => :basis_of_calculation_dispensing_fee,
        'HJ' => :basis_of_calculation_copay,
        'HK' => :basis_of_calculation_flat_sales_tax,
        'HM' => :basis_of_calculation_percentage_sales_tax,
        'NZ' => :amount_attributed_to_processor_fee,
        'EQ' => :patient_sales_tax_amount,
        '2Y' => :plan_sales_tax_amount,
        '4U' => :amount_of_coinsurance,
        '4V' => :basis_of_calculation_coinsurance,
        'MU' => :benefit_stage_count,
        'MV' => :benefit_stage_qualifier,
        'MW' => :benefit_stage_amount,
        'G3' => :estimated_generic_savings,
        'UC' => :spending_account_amount_remaining,
        'UD' => :health_plan_funded_assistance_amount,
        'UJ' => :amount_attributed_to_provider_network_selection,
        'UK' => :amount_attributed_to_product_selection_brand_drug,
        'UM' => :amount_attributed_to_product_selection_non_preferred_formulary_selection,
        'UN' => :amount_attributed_to_product_selection_brand_non_preferred_formulary_selection,
        'UP' => :amount_attributed_to_coverage_gap,
        'U8' => :ingredient_cost_contracted_reimbursable_amount,
        'U9' => :dispensing_fee_contracted_reimbursable_amount,
      })
    end
  end
end