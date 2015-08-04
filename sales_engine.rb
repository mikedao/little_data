require "CSV"

class SalesEngine
  attr_reader :mr

  def initialize
    @mr = MerchantRepository.new
  end

  def load_data(filename = "merchants.csv")
    data = FileIO.load_file(filename)
    @mr.load_data(data)
  end
end

class MerchantRepository
  attr_reader :merchants

  def initialize
    @merchants = []
  end

  def load_data(data)
    data.each do |row|
      @merchants << Merchant.new(row[:id], row[:name])
    end
  end
end

class FileIO
  def self.load_file(filename)
    CSV.open(filename, headers: true, header_converters: :symbol)
  end
end

class Merchant
  attr_reader :id,
              :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end
require "pry"; binding.pry
puts "done"
