module DZero::Segments::Concerns
  module Serializer
    # Serializes instance to string
    # @return [String]
    def to_s
      string = hash.to_a.map(&:join).join("\x1c")
      string = "\x1C" + string + "\x1E"
    end

    # Returns a hash
    # @return [Hash]
    def to_json(options = {})
      hash.inject({}) do |memo, (key, value)|
        readable_key = self.class.get_symbol_by_field(key) if options[:readable] == true
        memo[readable_key || key] = value
        memo
      end
    end
  end
end