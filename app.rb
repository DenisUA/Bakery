require_relative 'parser'
require 'byebug'

class Application
  def execute
    unless ARGV[0]
      puts 'Please provide input file path as first argument'
      return
    end

    contents = File.read(ARGV[0])

    parsed_data = Parser.new(contents).perform
    print(parsed_data)

  rescue ArgumentError => e
    puts "Can't resolve with input data"
    puts "Reason: #{e.message}"
    puts 'Quitting'
  end

  def print(parsed_data)
    parsed_data.each do |res|
      i = 0

      while i < res.count
        puts "#{res[0][:amount]} #{res[0][:code]} $ #{res[0][:total]}" if i == 0
        puts "  #{res[i][:repeats]} x #{res[i][:size]} $ #{res[i][:price]}"if i > 0
        i += 1
      end
    end
  end
end

Application.new.execute
