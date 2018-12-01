module DZero::Segments
  class Patient < Base
    Base.register_segment(self, identifier: '01')

    def self.field_id_to_symbol
      super.merge({
        'CX' => :patient_id_qualifier,
        'CY' => :patient_id,
        'C4' => :date_of_birth,
        'C5' => :patient_gender_code,
        'CA' => :patient_first_name,
        'CB' => :patient_last_name,
        'CM' => :patient_street_address,
        'CN' => :patient_city,
        'CO' => :patient_state_or_province,
        'CP' => :patient_zip_postal_code,
        'CQ' => :patient_phone_number,
        'C7' => :place_of_service,
        'CZ' => :employer_id,
        '1C' => :smoker_non_smoker_code,
        '2C' => :pregnancy_indicator,
        'HN' => :patient_email_address,
        '4X' => :patient_residence,
      })
    end
  end
end