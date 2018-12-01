FactoryBot.define do
  factory :response, class: ::DZero::Transmissions::Request do
    version { 'D0' }
    transaction_code { 'B1' }
    transaction_count { '1' }
    header_response_status { 'A' }
    service_provider_id_qualifier { '01' }
    service_provider_id { '1111111111' }
    date_of_service { Date.today.strftime('%m%d%Y') }
    segments { [] }

    initialize_with do
      ::DZero::Transmissions::Response.new(
        header: {
          version: attributes[:version],
          transaction_code: attributes[:transaction_code],
          transaction_count: attributes[:transaction_count],
          header_response_status: attributes[:header_response_status],
          service_provider_id_qualifier: attributes[:service_provider_id_qualifier],
          service_provider_id: attributes[:service_provider_id],
          date_of_service: attributes[:date_of_service]
        }, 
        segments: segments
      )
    end
  end
end