FactoryBot.define do
  factory :segment, class: DZero::Segments::Base do
    hash { {} }

    initialize_with do
     DZero::Segments::Base.build(attributes[:base_hash].merge(attributes[:hash]))
    end
  end

  factory :insurance_segment, class: DZero::Segments::Insurance do
    hash { {} }
    base_hash do
      {
        cardholder_id: "TEST", # Cardholder ID
        cardholder_first_name: "AUSTIN", # Cardholder first name
        cardholder_last_name: "PIVARNIK", # Cardholder last name
      }
    end

    initialize_with do
      DZero::Segments::Insurance.build(attributes[:base_hash].merge(attributes[:hash]))
    end
  end

  factory :patient_segment, class: DZero::Segments::Patient do
    hash { {} }
    base_hash do
      {
        date_of_birth: Date.strptime('19001225', '%Y%m%d').strftime('%Y%m%d'), # Patient DOB
        patient_first_name: 'AUSTIN', # PATIENT FIRST NAME
        patient_last_name: 'PIVARNIK', # PATIENT LAST NAME
        patient_street_address: '9 BRIARCROFT AVE', # PATIENT STREET ADDRESS
        patient_city: 'TRUMBULL', # PATIENT CITY ADDRESS
        patient_state_or_province: 'CT', # PATIENT STATE ADDRESS
        patient_zip_postal_code: '06611', # PATIENT ZIP CODE
        patient_phone_number: '2035555555', # PATIENT PHONE NUMBER
      }
    end

    initialize_with do
      DZero::Segments::Patient.build(attributes[:base_hash].merge(attributes[:hash]))
    end
  end

  factory :claim_segment, class: DZero::Segments::Claim do
    hash { {} }
    base_hash do
      {
        prescription_reference_number_qualifier: "1", # PRESCRIPTION/SERVICE REFERENCE NUMBER QUALIFIER (Must be exactly this value: "1")
        prescription_reference_number: "417083741803748", # UNIQUE PRESCRIPTION/SERVICE REFERENCE NUMBER (RX_NUMBER + FILL_NUMBER),
        product_service_id: Erx::Processors::B1CreateOrder::NDC_1, # Product/Service ID
        fill_number: '0'
      }
    end

    initialize_with do
      DZero::Segments::Claim.build(attributes[:base_hash].merge(attributes[:hash]))
    end
  end

  factory :pricing_segment, class: DZero::Segments::Pricing do
    hash { {} }
    base_hash do
      {}
    end

    initialize_with do
      DZero::Segments::Pricing.build(attributes[:base_hash].merge(attributes[:hash]))
    end
  end
end