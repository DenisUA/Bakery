class Parser
  CODES = %w[VS5 MB11 CF].freeze
  PACKAGES = {
    'VS5' =>
      [
        { size: 3, price: 6.99 },
        { size: 5, price: 8.99 }
      ],
    'MB11' =>
      [
        { size: 2, price: 9.95 },
        { size: 5, price: 16.95 },
        { size: 8, price: 24.95 }
      ],
    'CF' =>
      [
        { size: 3, price: 5.95 },
        { size: 5, price: 9.95 },
        { size: 9, price: 16.99 }
      ]
  }

  def initialize(input)
    @input = input
  end

  def perform
    command_lines = @input.split("\n").delete_if &:empty?
    result = []

    command_lines.each do |line|
      values = line.split(' ')
      items_total = values[0].to_i
      items_code = values[1].to_s
      result << code_to_packages(items_total, items_code)
    end

    result
  end

private

  def code_to_packages(amount, code)
    return if valid_data?(amount, code)
    available_packages = available_packages(code)
    needed_packages = needed_packages(available_packages, amount)
    format_data(needed_packages, available_packages, code, amount)
  end

  def needed_packages(available_packages, amount)
    package_sizes = available_packages.map { |k| k[:size] }
    i = 0
    while i <= package_sizes.length
      result = package_matcher(package_sizes[i..package_sizes.length], amount)
      if !result.empty?
        return result
      elsif result.empty? && i + 1 == package_sizes.length
        raise ArgumentError, 'Incorrect amount'
      end
      i += 1
    end
  end

  def package_matcher(packages, amount)
    i = 0
    amount = amount
    max_package = packages[0]
    result = []

    while i <= packages.length
      amount -= max_package
      if amount >= packages.min
        result << max_package
      elsif amount < packages.min && amount != 0
        amount += max_package
        i += 1
        return [] if packages[i].nil?
        max_package = packages[i]
      else
        result << max_package
        return result
      end
    end
  end

  def available_packages(code)
    PACKAGES[code].sort_by { |key| -key[:size] }
  end

  def format_data(packets, prices, code, amount)
    total = []
    result = []

    duplicates(packets).each do |packet, times|
      used_packet = prices.find { |k| k[:size] == packet }
      data = {
        size: used_packet.values[0],
        repeats: times,
        price: used_packet.values[1]
      }
      total << used_packet.values[1] * times
      result << data
    end

    result.unshift ({
      code: code,
      amount: amount,
      total: total.inject(0, :+).round(2)
    })
  end

  def duplicates(packets)
    packets.each_with_object(Hash.new(0)) { |packet, counts| counts[packet] += 1 }
  end

  def valid_data?(amount, code)
    raise ArgumentError, 'Incorrect code input' unless CODES.include?(code)
    raise ArgumentError, 'Incorrect amount' if amount < 2
  end
end
