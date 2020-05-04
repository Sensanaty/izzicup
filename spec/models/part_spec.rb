require 'rails_helper'

RSpec.describe Part, type: :model do
  let(:part) { Part.new( part_number: "174097-85",
                         date_added: DateTime.current,
                         description: "MASK",
                         quantity_available: 250,
                         condition: "NE",
                         base_price: 28000,
                         cost: 25000,
                         minimum_order: 10,
                         quote_type: "OUTRIGHT SALE",
                         tag: "MFR 8130/TRACE; STOCK USA **MOQ=10EA**")}

  context 'basic checks' do
    it 'is valid with proper attributes' do
      expect(part).to be_valid
    end

    it 'is not valid without a Part Number' do
      part.part_number = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Date Added' do
      part.date_added = nil
      expect(part).to_not be_valid
    end

    it 'is not valid without a Description' do
      part.description = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Quantity Available' do
      part.quantity_available = ''
      # expect { part.save }.to raise_error TypeError
      expect(part).to_not be_valid
    end

    it 'is not valid without a Condition' do
      part.condition = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Base Price' do
      part.base_price = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Cost' do
      part.cost = nil
      expect(part).to_not be_valid
    end

    it 'is not valid without a Minimum Order' do
      part.minimum_order = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Quote Type' do
      part.quote_type = ''
      expect(part).to_not be_valid
    end

    it 'is not valid without a Tag' do
      part.tag = ''
      expect(part).to_not be_valid
    end

  end

  context 'validations' do

    context 'strings' do
      it "Part Number must be all caps" do
        part.part_number = "abcdefg123456"
        part.save
        expect(part.part_number).to eq(part.part_number.upcase), "Expected #{part.part_number.upcase}, instead got #{part.part_number}"
      end

      it 'Description must be all caps' do
        part.description = "mask"
        part.save
        expect(part.description).to eq(part.description.upcase), "Expected #{part.description.upcase}, instead got #{part.description}"
      end

      it 'Condition must be all caps' do
        part.condition = "ne"
        part.save
        expect(part.condition).to eq(part.condition.upcase), "Expected #{part.condition.upcase}, instead got #{part.condition}"
      end

      it 'Quote Type must be all caps' do
        part.quote_type = "mask"
        part.save
        expect(part.quote_type).to eq(part.quote_type.upcase), "Expected #{part.quote_type.upcase}, instead got #{part.quote_type}"
      end

      it 'Tag must be all caps' do
        part.tag = "mask"
        part.save
        expect(part.tag).to eq(part.tag.upcase), "Expected #{part.tag.upcase}, instead got #{part.tag}"
      end
    end

    context "integers" do
      it 'Quantity Available cannot be 0 or negative' do
        part.quantity_available = 0
        expect(part).to_not be_valid, "Quantity Available cannot be 0"

        part.quantity_available = -1
        expect(part).to_not be_valid, "Quantity Available cannot be less than 0"
      end

      it 'Minimum Order cannot be 0 or negative' do
        part.quantity_available = 0
        expect(part).to_not be_valid, "Quantity Available cannot be 0"

        part.quantity_available = -1
        expect(part).to_not be_valid, "Quantity Available cannot be less than 0"
      end

      it 'Minimum Order cannot be larger than Quantity Available' do
        part.quantity_available = 1
        part.minimum_order = 2

        expect(part).to_not be_valid, "There must be more available than the minimum order"
      end
    end
  end
end
