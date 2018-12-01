module DZero::Segments
  class PharmacyProvider < Base
    Base.register_segment(self, identifier: '02')

    def self.field_id_to_symbol
      super.merge({
        'EY' => :provider_id_qualifier,
        'E9' => :provider_id,
      })
    end
  end
end