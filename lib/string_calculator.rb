class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = parse_delimiter(numbers)
    parsed_numbers = split_numbers(numbers, delimiter)

    check_for_negatives!(parsed_numbers)

    parsed_numbers.sum
  end

  private

  def parse_delimiter(numbers)
    return [",|\n", numbers] unless numbers.start_with?("//")

    header, remaining_numbers = numbers.split("\n", 2)
    delimiter = Regexp.escape(header[2])
    [delimiter, remaining_numbers]
  end

  def split_numbers(numbers, delimiter)
    numbers.split(/#{delimiter}/).map(&:to_i)
  end

  def check_for_negatives!(numbers)
    negatives = numbers.select { |n| n < 0 }
    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
