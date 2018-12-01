module DZero::Segments
  class ResponseInsurance < Base
    Base.register_segment(self, identifier: '25')

    def self.field_id_to_symbol
      super.merge({
        'C1' => :group_id,
        'FO' => :plan_id,
        '2F' => :network_reimbursement_id,
        'J7' => :payer_id_qualifier,
        'J8' => :payer_id,
        'N5' => :medicaid_id_number,
        'N6' => :medicaid_agency_number,
        'C2' => :cardholder_id,
      })
    end
  end
end