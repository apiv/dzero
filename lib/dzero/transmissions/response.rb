module DZero::Transmissions
  class Response < Base
    class << self
      def header_schema
        {
          version: 2,
          transaction_code: 2,
          transaction_count: 1,
          header_response_status: 1,
          service_provider_id_qualifier: 2,
          service_provider_id: 15,
          date_of_service: 8,
        }
      end
    end
  end
end
