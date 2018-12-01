module DZero::Segments
  class Coupon < Base
    Base.register_segment(self, identifier: '09')

    def self.field_id_to_symbol
      super.merge({
        'KE' => :coupon_type,
        'ME' => :coupon_number,
        'NE' => :coupon_value_amount,
      })
    end
  end
end