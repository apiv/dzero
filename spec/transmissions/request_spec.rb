RSpec.describe DZero::Transmissions::Request do
  subject do
    response = DZero::Transmissions::Response.new(
      header: {
        :bin_number=>"999999",
        :version=>"D0",
        :transaction_code=>"B1",
        :processor_control_number=>"",
        :transaction_count=>"1",
        :service_provider_id_qualifier=>"01",
        :service_provider_id=>"1111111111",
        :date_of_service=>"20181106",
        :software=>""
      },
      transmission_group: DZero::Transmissions::Groups::TransmissionGroup.new(
        segments: [
          DZero::Segments::ResponseMessage.build({
            message: "TEST MESSAGE"
          })
        ]
      ),
      transaction_groups: [
        DZero::Transmissions::Groups::TransactionGroup.new(
          segments: [
            DZero::Segments::ResponseStatus.build({
              response_status: "C"
            })
          ]
        ),
        DZero::Transmissions::Groups::TransactionGroup.new(
          segments: [
            DZero::Segments::ResponseStatus.build({
              response_status: "R"
            })
          ]
        )
      ]
    )
  end

  describe '#to_s' do
    it 'stringifies correctly' do
      expected = File.read("./spec/fixtures/b1.2_groups.request")
      expect(subject.to_s).to eq(expected)
    end
  end

  describe '#to_json' do
    it 'stringifies correctly' do
      expected = JSON.parse(File.read("./spec/fixtures/b1.2_groups.request.json"))
      expect(subject.to_json.deep_stringify_keys).to eql(expected)
    end
  end
end