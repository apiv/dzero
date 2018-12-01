module DZero::Segments
  class Compound < Base
    Base.register_segment(self, identifier: '10')

    def self.field_id_to_symbol
      super.merge({
        'EF' => :compound_dosage_form_description_code,
        'EG' => :compound_dispensing_unit_form_indicator,
        'EC' => :compound_ingredient_component_count,
        'RE' => :compound_product_id_qualifier,
        'TE' => :compound_product_id,
        'ED' => :compound_ingredient_quantity,
        'EE' => :compound_ingredient_drug_cost,
        'UE' => :compound_ingredient_basis_of_cost_determination,
        '2G' => :compound_ingredient_modifier_code_count,
        '2H' => :compound_ingredient_modifier_code,
      })
    end
  end
end