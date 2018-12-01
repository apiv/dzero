module DZero::Segments
  class ResponseClaim < Base
    Base.register_segment(self, identifier: '22')

    def self.field_id_to_symbol
      super.merge({
        'EM' => :prescription_reference_number_qualifier,
        'D2' => :prescription_reference_number,
        '9F' => :preferred_product_count,
        'AP' => :preferred_product_id_qualifier,
        'AR' => :preferred_product_id,
        'AS' => :preferred_product_incentive,
        'AT' => :preferred_product_cost_share_incentive,
        'AU' => :preferred_product_description,
        'N4' => :medicade_icn,
      })
    end
  end
end