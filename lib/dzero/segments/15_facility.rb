module DZero::Segments
  class Facility < Base
    Base.register_segment(self, identifier: '15')

    def self.field_id_to_symbol
      super.merge({
        '8C' => :facility_id,
        '3Q' => :facility_name,
        '3U' => :facility_street_address,
        '5J' => :facility_city_address,
        '3V' => :facility_state_province_address,
        '6D' => :facility_zip_postal_zone,
      })
    end
  end
end