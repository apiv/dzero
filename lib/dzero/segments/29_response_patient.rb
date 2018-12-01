module DZero::Segments
  class ResponsePatient < Base
    Base.register_segment(self, identifier: '29')

    def self.field_id_to_symbol
      super.merge({
        'CA' => :patient_first_name,
        'CB' => :patient_last_name,
        'C4' => :date_of_birth,
      })
    end
  end
end