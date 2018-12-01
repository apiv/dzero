module DZero::Segments
  class ResponseMessage < Base
    Base.register_segment(self, identifier: '20')

    def self.field_id_to_symbol
      super.merge({
        'F4' => :message,
      })
    end
  end
end