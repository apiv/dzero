# DZero

DZero is a robust and easy-to-use NCPDP Telecommunications Standard D.0 Message **parser** and **serializer**.

## Installation

Add this to your gemfile:
```
gem 'dzero', github: 'apiv/dzero'
```

And then run bundle install.

## Features

- ✅ Complete field mapping for all **26** D.0 Segment types.
  - This means you can access field values by a simple name instead of it's 2-character identifier. (ex: `claim_segment[:fill_number]` instead of `claim_segment['D3']`)
- ✅ Parse D.0 Requests or Responses with ease.
  - ex: `DZero::Transmissions::Request.parse(your_raw_string)`
- ✅ Build D.0 Requests or Responses with ease.
  - ex: `DZero::Transmissions::Request.new(...)` (see [Building](#Building) below)
- ✅ Supports multiple transaction groups
  - ex: `request.transaction_groups[2].claim_segment`
- ✅ Serialize a D.0 message to JSON
  - ex: `request.to_json`

## Usage

### Parsing and Manipulating

#### Parsing

```ruby
require 'dzero'

request = DZero::Transmissions::Request.parse(raw_message_string)
```

The above snippet will return a new instance of `DZero::Transmissions::Request`.

#### Reading the header

```ruby
pp request.header
# =>
# {:bin_number=>"999999",
#  :version=>"D0",
#  :transaction_code=>"B1",
#  :processor_control_number=>"",
#  :transaction_count=>"1",
#  :service_provider_id_qualifier=>"01",
#  :service_provider_id=>"1111111111",
#  :date_of_service=>"20181106",
#  :software=>""}
```

#### Reading a single segment

```ruby
request.transmission_group.patient_segment
# => #<DZero::Segments::Patient>

request.transmission_group.insurance_segment
# => #<DZero::Segments::Insurance>

request.transaction_groups.first.claim_segment
# => #<DZero::Segments::Claim>

request.transaction_groups[2].claim_segment
# => #<DZero::Segments::Claim>
```

#### Reading a field in a segment

Fields of a segment can be accessed via the `[]` method, which takes either a symbol or a string.

```ruby
segment = request.transaction_groups.first.claim_segment
# => #<DZero::Segments::Claim>
segment[:segment_identification]
# => "07"
segment["AM"]
# => "07"
segment[:quantity_dispensed]
# => "2000"
segment["E7"]
# => "2000"
```

#### Modifying a field in a segment

Fields of a segment can be accessed via the `[]` method, which takes either a symbol or a string. If a segment or field does not yet exist when it is attempted to be accessed, it will be created and added to the message.

```ruby
segment = request.transaction_groups.first.claim_segment
segment[:quantity_dispensed]
# => "2000"
segment[:quantity_dispensed] = "9990"
# => "9990"
segment["E7"]
# => "9990"
segment["E7"] = "5555"
# => "5555"
segment[:quantity_dispensed]
# => "5555"
```

#### Serializing to json

`Request`, `Response`, `TransmissionGroup`, `TransactionGroup`, and `Segment` all have **`to_json`** methods.

```ruby
request.to_json
```

**`to_json`** takes two options:
- **`:readable`** - if this is true, symbols will be used for the fields of a segment, instead of the field identifiers.
- **`:key_group_by_segment_sym`** - if this is true, groups will be objects instead of arrays of objects. A group object will be keyed by the segment identifiers it contains.

### Building

For messages with a single transaction group, you can pass segments in with the **`segments`** argument. DZero will automatically filter the segments into the correct locations (either the **`transmission_group`** or the first **`transaction_group`**)

```ruby
require 'dzero'

request = DZero::Transmissions::Request.new({
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
  segments: [
    DZero::Segments::Patient.build({
      patient_first_name: 'AUSTIN',
      patient_last_name: 'PIVARNIK',
      patient_phone_number: '5555555555',
    })
  ]
})
```

For more control over the structure of the message, you can manually construct the `transmission_group` and the `transaction_group`.

```ruby
require 'dzero'

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
```

### Stringifying a message

To render an instance of `Request` or `Response` into a D.0 string, simply call `#to_s` on the instance.

```ruby
request.to_s
# => "999999D0B1          1011111111111     20181106          \u001E\u001CAM01\u001CCAAUSTIN\u001CCBPIVARNIK\u001CCQ5555555555"
```

### Serializing a message to JSON

```rb
request.to_json(readable: true, key_group_by_segment_sym: true)
# => {
#   "header": {
#     "bin_number": "999999",
#     "version": "D0",
#     "transaction_code": "B1",
#     "processor_control_number": "",
#     "transaction_count": "1",
#     "service_provider_id_qualifier": "01",
#     "service_provider_id": "9999999999",
#     "date_of_service": "11282018",
#     "software": ""
#   },
#   "transmission_group": {
#     "patient": {
#       "segment_identification": "01",
#       "patient_first_name": "AUSTIN",
#       "patient_last_name": "PIVARNIK",
#       "patient_street_address": "50 BEALE ST",
#       "patient_city": "SAN FRANCISCO",
#       "patient_state_or_province": "CA",
#       "patient_zip_postal_code": "94105",
#       "patient_phone_number": "5555555555"
#     }
#   },
#   "transaction_groups": [
#     {
#       "claim": {
#         "segment_identification": "07",
#         "prescription_reference_number_qualifier": "1",
#         "prescription_reference_number": "9999999999",
#         "product_service_id_qualifier": "03",
#         "product_service_id": "99999999999",
#         "quantity_dispensed": "2000",
#         "fill_number": "0",
#         "days_supply": "1",
#         "compound_code": "1",
#         "dispense_as_written_product_selection_code": "0",
#         "date_prescription_written": "20181025",
#         "number_of_refills_authorized": "99",
#         "prescription_origin_code": "1",
#         "unit_of_measure": "EA",
#         "level_of_service": "0",
#         "patient_assignment_indicator": "Y",
#         "pharmacy_service_type": "1"
#       },
#       "pricing": {
#         "segment_identification": "11",
#         "ingredient_cost_submitted": "A",
#         "dispensing_fee_submitted": "{",
#         "patient_paid_amount_submitted": "{",
#         "percentage_sales_tax_rate_submitted": "1750{",
#         "usual_and_customary_charge": "A",
#         "gross_amount_due": "A",
#         "basis_of_cost_determination": "01"
#       }
#     }
#   ]
# }
```
