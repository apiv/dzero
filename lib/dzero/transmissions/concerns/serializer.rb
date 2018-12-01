module DZero::Transmissions::Concerns
  module Serializer
    def to_json(options = {})
      {
        header: header,
        transmission_group: transmission_group.to_json(options),
        transaction_groups: transaction_groups.map { |group| group.to_json(options) }
      }
    end
  end
end