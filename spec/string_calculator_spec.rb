require 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'when input is an empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'when input is a single number' do
      it 'returns the number itself' do
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'when input contains two numbers' do
      it 'returns their sum' do
        expect(calculator.add('1,5')).to eq(6)
      end
    end

    context 'when input contains multiple numbers' do
      it 'returns their sum' do
        expect(calculator.add('1,2,3,4')).to eq(10)
      end
    end

    context 'when input contains new lines as delimiters' do
      it 'returns the sum' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when input contains a custom delimiter' do
      it 'returns the sum' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when input contains negative numbers' do
      it 'raises an error with negative numbers listed' do
        expect { calculator.add("1,-2,3,-4") }
          .to raise_error("negative numbers not allowed: -2, -4")
      end
    end
  end
end
