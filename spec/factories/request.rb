FactoryBot.define do
  factory :request, class: ::DZero::Transmissions::Request do
    bin_number { '999999' }
    version { 'D0' }
    transaction_code { 'B1' }
    transaction_count { '1' }
    service_provider_id_qualifier { '01' }
    service_provider_id { '1111111111' }
    date_of_service { Date.today.strftime('%m%d%Y') }
    segments { [] }

    initialize_with do
      ::DZero::Transmissions::Request.new(
        header: {
          bin_number: attributes[:bin_number],
          version: attributes[:version],
          transaction_code: attributes[:transaction_code],
          transaction_count: attributes[:transaction_count],
          service_provider_id_qualifier: attributes[:service_provider_id_qualifier],
          service_provider_id: attributes[:service_provider_id],
          date_of_service: attributes[:date_of_service]
        },
        segments: segments
      )
    end
  end
end