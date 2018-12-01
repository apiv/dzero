module DZero::Segments
  class ResponseInsuranceAdditionalDocumentation < Base
    Base.register_segment(self, identifier: '27')

    def self.field_id_to_symbol
      super.merge({
        'UR' => :medicare_part_d_coverage_code,
        'UQ' => :cms_low_income_cost_sharing_lics_level,
        'U1' => :contract_number,
        'FF' => :formulary_id,
        'U6' => :benefit_id,
        'US' => :next_medicare_part_d_effective_date,
        'UT' => :next_medicare_part_d_termination_date,
      })
    end
  end
end