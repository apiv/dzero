module DZero::Segments
  class Narrative < Base
    Base.register_segment(self, identifier: '16')

    def self.field_id_to_symbol
      super.merge({
        'BM' => :narrative_message,
      })
    end
  end
end