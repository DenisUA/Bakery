require_relative '../parser'

describe Parser do
  describe '.parse' do
    context 'with correct data' do
      it 'returns parsed input' do
        content = File.read('spec/fixtures/correct_input')
        parsed_input = Parser.new(content).perform

        hash = parsed_input[0]

        expect(hash[0][:code]).to eq('VS5')
        expect(hash[0][:amount]).to eq(10)
        expect(hash[0][:total]).to eq(17.98)
        expect(hash[1][:size]).to eq(5)
        expect(hash[1][:repeats]).to eq(2)
        expect(hash[1][:price]).to eq(8.99)
      end
    end

    context 'with incorrect data - digits' do
      it 'raises exception' do
        expect { Parser.new(File.read('spec/fixtures/bad_input_digits')).perform }.to raise_error(ArgumentError)
      end
    end

    context 'with incorrect data - codes' do
      it 'raises exception' do
        expect { Parser.new(File.read('spec/fixtures/bad_input_code')).perform }
          .to raise_error(ArgumentError, 'Incorrect code input')
      end
    end

    context 'with incorrect data - impossible combination' do
      it 'raises exception' do
        expect { Parser.new(File.read('spec/fixtures/bad_input_impossible_combination')).perform }
          .to raise_error(ArgumentError, 'Incorrect amount')
      end
    end
  end
end
