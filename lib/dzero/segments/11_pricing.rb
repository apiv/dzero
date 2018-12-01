module DZero::Segments
  class Pricing < Base
    Base.register_segment(self, identifier: '11')

    def self.field_id_to_symbol
      super.merge({
        'D9' => :ingredient_cost_submitted,
        'DC' => :dispensing_fee_submitted,
        'BE' => :professional_service_fee_submitted,
        'DX' => :patient_paid_amount_submitted,
        'E3' => :incentive_amount_submitted,
        'H7' => :other_amount_claimed_submitted_count,
        'H8' => :other_amount_claimed_submitted_qualifier,
        'H9' => :other_amount_claimed_submitted,
        'HA' => :flat_sales_tax_amount_submitted,
        'GE' => :percentage_sales_tax_amount_submitted,
        'HE' => :percentage_sales_tax_rate_submitted,
        'JE' => :percentage_sales_tax_basis_submitted,
        'DQ' => :usual_and_customary_charge,
        'DU' => :gross_amount_due,
        'DN' => :basis_of_cost_determination,
        'N3' => :medicaid_paid_amount    ,
      })
    end
  end
end