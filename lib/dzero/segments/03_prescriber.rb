module DZero::Segments
  class Prescriber < Base
    Base.register_segment(self, identifier: '03')

    def self.field_id_to_symbol
      super.merge({
        'EZ' => :prescriber_id_qualifier,
        'DB' => :prescriber_id,
        'DR' => :prescriber_last_name,
        'PM' => :prescriber_phone_number,
        '2E' => :primary_care_provider_id_qualifier,
        'DL' => :primary_care_provider_id,
        '4E' => :primary_care_provider_last_name,
        '2J' => :prescriber_first_name,
        '2K' => :prescriber_street_address,
        '2M' => :prescriber_city_address,
        '2N' => :prescriber_state_province_address,
        '2P' => :prescriber_zip_postal_zone,
      })
    end
  end
end