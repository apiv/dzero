module DZero::Segments
  class PriorAuth < Base
    Base.register_segment(self, identifier: '12')

    def self.field_id_to_symbol
      super.merge({
        'PA' => :request_type,
        'PB' => :request_period_date_begin,
        'PC' => :request_period_date_end,
        'PD' => :basis_of_request,
        'PE' => :authorized_representative_first_name,
        'PF' => :authorized_rep_last_name,
        'PG' => :authorized_rep_street_address,
        'PH' => :authorized_rep_city,
        'PJ' => :authorized_rep_state_province,
        'PK' => :authorized_rep_zip_postal_code,
        'PY' => :prior_authorization_number_assigned,
        'F3' => :authorization_number,
        'PP' => :prior_authorization_supporting_documentation,
      })
    end
  end
end