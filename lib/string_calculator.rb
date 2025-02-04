class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ",|\n"
    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      delimiter = Regexp.escape(header[2])
    end

    parsed_numbers = numbers.split(/#{delimiter}/).map(&:to_i)
    negatives = parsed_numbers.select { |n| n < 0 }

    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    parsed_numbers.sum
  end
end