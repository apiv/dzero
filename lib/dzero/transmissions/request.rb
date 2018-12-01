module DZero::Transmissions
  class Request < Base
    class << self
      def header_schema
        {
          bin_number: 6,
          version: 2,
          transaction_code: 2,
          processor_control_number: 10,
          transaction_count: 1,
          service_provider_id_qualifier: 2,
          service_provider_id: 15,
          date_of_service: 8,
          software: 10
        }
      end
    end
  end
end
