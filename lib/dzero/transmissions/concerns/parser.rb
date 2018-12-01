module DZero::Transmissions::Concerns
  module Parser
    def parse(string)
      string = string.dup
      header_length = header_schema.values.reduce(0, :+)
      header = ::DZero::Utils::FixedWidth.parse_fixed_width(header_schema, string.slice!(0..header_length))

      raw_transaction_groups = string.split(::DZero::Constants::GROUP_SEPARATOR)
      raw_transmission_group = raw_transaction_groups.shift

      transmission_group = ::DZero::Transmissions::Groups::TransmissionGroup.parse(raw_transmission_group)
      transaction_groups = raw_transaction_groups.map do |raw_transaction_group|
        ::DZero::Transmissions::Groups::TransactionGroup.parse(raw_transaction_group)
      end

      new(
        header: header,
        transmission_group: transmission_group,
        transaction_groups: transaction_groups
      )
    end
  end
end