RSpec.describe DZero::Segments::Base do
  describe '.get_klass_by_symbol' do
    SEGMENT_SYMBOLS = [
      :patient,
      :pharmacy_provider,
      :prescriber,
      :insurance,
      :coord_of_benefits,
      :workers_comp,
      :claim,
      :dur_pps,
      :coupon,
      :compound,
      :pricing,
      :prior_auth,
      :clinical,
      :additional_documentation,
      :facility,
      :narrative,
      :response_message,
      :response_status,
      :response_claim,
      :response_pricing,
      :response_dur_pps,
      :response_insurance,
      :response_prior_auth,
      :response_insurance_additional_documentation,
      :response_coord_of_benefits,
      :response_patient,
    ]
    
    it 'this spec accounts for every segment' do
      # UPDATE SEGMENT_SYMBOLS WHEN A NEW SEGMENT IS ADDED!
      expect(SEGMENT_SYMBOLS.count).to eq(DZero::Segments::Base.segment_id_to_symbol.count)
    end

    SEGMENT_SYMBOLS.each do |symbol|
      context "given #{symbol}" do
        it 'should get the correct class' do
          klass = DZero::Segments::Base.get_klass_by_symbol(symbol)

          expect(klass).to_not be_nil
          expect(klass).to_not eq(DZero::Segments::Base)

          expect(klass.symbol).to eq(symbol)
        end
      end
    end
  end

  describe '.get_klass_by_identifier' do
    SEGMENT_IDENTIFIERS = [
      '01',
      '02',
      '03',
      '04',
      '05',
      '06',
      '07',
      '08',
      '09',
      '10',
      '11',
      '12',
      '13',
      '14',
      '15',
      '16',
      '20',
      '21',
      '22',
      '23',
      '24',
      '25',
      '26',
      '27',
      '28',
      '29',
    ]
    
    it 'this spec accounts for every segment' do
      # UPDATE SEGMENT_IDENTIFIERS WHEN A NEW SEGMENT IS ADDED!
      expect(SEGMENT_IDENTIFIERS.count).to eq(DZero::Segments::Base.segment_id_to_klass.count)
    end

    SEGMENT_IDENTIFIERS.each do |segment_identifier|
      context "given #{segment_identifier}" do
        it 'should get the correct class' do
          klass = DZero::Segments::Base.get_klass_by_identifier(segment_identifier)

          expect(klass).to_not be_nil
          expect(klass).to_not eq(DZero::Segments::Base)

          expect(klass.segment_identifier).to eq(segment_identifier)
        end
      end
    end
  end

  describe '.new' do
    DZero::Segments::Base.segment_id_to_klass.values.each do |klass|
      context klass.name do
        it 'adds segment_identification field automatically' do
          segment = klass.new()

          expect(segment[:segment_identification].length).to be(2)
          expect(segment[:segment_identification]).to eq(klass.segment_identifier)

          expect(segment["AM"].length).to be(2)
          expect(segment["AM"]).to eq(klass.segment_identifier)
        end
      end
    end
  end

  describe '#[]=' do
    DZero::Segments::Base.segment_id_to_klass.values.each do |klass|
      context klass.name do
        let(:segment) { klass.new() }
        let(:any_field_id) { klass.field_id_to_symbol.keys.last }
        let(:any_field_sym) { klass.field_id_to_symbol.values[1] }
        let(:test_value) { 'TEST VALUE' }

        it 'merges into the existing hash by id' do
          segment[any_field_id] = test_value

          expect(segment[any_field_id]).to eq(test_value)
        end

        it 'merges into the existing hash by symbol' do
          segment[any_field_sym] = test_value

          expect(segment[any_field_sym]).to eq(test_value)
        end
      end
    end
  end

  describe '#to_s' do
    DZero::Segments::Base.segment_id_to_klass.values.each do |klass|
      context klass.name do
        let(:any_field_id) { klass.field_id_to_symbol.keys.last }
        let(:any_field_sym) { klass.field_id_to_symbol.values[1] }
        let(:test_value) { 'TEST VALUE' }

        let(:segment) { klass.new({ any_field_id => test_value, any_field_sym => test_value }) }

        it 'starts with the segment_identification field' do
          expect(segment.to_s).to match("AM#{klass.segment_identifier}")
        end
      end
    end
  end

  describe '#to_json' do
    DZero::Segments::Base.segment_id_to_klass.values.each do |klass|
      context klass.name do
        let(:any_field_id) { klass.field_id_to_symbol.keys.last }
        let(:any_field_sym) { klass.field_id_to_symbol.values.last }
        let(:test_value) { 'TEST VALUE' }

        let(:segment) { klass.new({ any_field_sym => test_value }) }

        it 'works with no options' do
          expect(segment.to_json).to eq({
            "AM" => klass.segment_identifier,
            any_field_id => test_value
          })
        end

        it 'works with :readable option' do
          expect(segment.to_json(readable: true)).to eq({
            :segment_identification => klass.segment_identifier,
            any_field_sym => test_value
          })
        end
      end
    end
  end
end
