module DZero::Segments::Concerns
  module Parser
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      # parses from a string
      # @param [String] source
      def parse(source)
        elements            = source.split(/[\x1C\x1E\x3\x1D]/).delete_if(&:empty?)
        segment_hash        = Hash[elements.map {|e| [e[0..1], e[2..-1]]}]
  
        self.build(segment_hash)
      end
    end
  end
end