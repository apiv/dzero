module DZero::Segments
  class WorkersComp < Base
    Base.register_segment(self, identifier: '06')

    def self.field_id_to_symbol
      super.merge({
        'DY' => :date_of_injury,
        'CF' => :employer_name,
        'CG' => :employer_street_address,
        'CH' => :employer_city_address,
        'CI' => :employer_state_province_address,
        'CJ' => :employer_zip_postal_code,
        'CK' => :employer_phone_number,
        'CL' => :employer_contact_name,
        'CR' => :carrier_id,
        'DZ' => :claim_reference_id,
        'TR' => :billing_entity_type_indicator,
        'TS' => :pay_to_qualifier,
        'TT' => :pay_to_id,
        'TU' => :pay_to_name,
        'TV' => :pay_to_street_address,
        'TW' => :pay_to_city_address,
        'TX' => :pay_to_state_province_address,
        'TY' => :pay_to_zip_postal_zone,
        'TZ' => :generic_equivalent_product_id_qualifier,
        'UA' => :generic_equivalent_product_id,
      })
    end
  end
end