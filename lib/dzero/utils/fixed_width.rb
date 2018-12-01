module DZero::Utils
  module FixedWidth
    def self.parse_fixed_width(fields, string)
      field_sizes   = fields.values
      field_pattern = "A#{field_sizes.join('A')}"
      headers       = fields.keys
      values        = string.unpack(field_pattern)
      Hash[headers.zip(values)]
    end

    def self.to_fixed_width(source, schema)
      string = ''
      schema.each do |field, size|
        string = string + ("%-#{size}.#{size}s" % source[field])
      end
      return string
    end
  end
end