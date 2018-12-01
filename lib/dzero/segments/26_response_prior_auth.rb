module DZero::Segments
  class ResponsePriorAuth < Base
    Base.register_segment(self, identifier: '26')

    def self.field_id_to_symbol
      super.merge({
        'PR' => :prior_authorization_processed_date,
        'PS' => :prior_authorization_effective_date,
        'PT' => :prior_authorization_expiration_date,
        'RA' => :prior_authorization_quantity,
        'RB' => :prior_authorization_dollars_authorized,
        'PW' => :prior_authorization_number_of_refills_authorized,
        'PX' => :prior_authorization_quantity_accumulated,
        'PY' => :prior_authorization_number_assigned,
      })
    end
  end
end