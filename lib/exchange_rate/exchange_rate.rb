class ExchangeRate
  attr_reader :date, :base_currency, :counter_currency, :rate

  def initialize(date, base_currency, counter_currency, rate = nil)
    @date = date
    @base_currency = base_currency
    @counter_currency = counter_currency
    @rate = rate
  end

  def self.at(date, base_currency, counter_currency)
    exchange_rate = ExchangeRate.new(date, base_currency, counter_currency)
    exchange_rate.get_exchange_rate
  end

  def get_exchange_rate
    parser = Parser.new
    rate = parser.get_rate(self)
    ExchangeRate.new(@date, @base_currency, @counter_currency, rate)
  end

  def ==(exchange_rate)
    counter_currencies_equal?(exchange_rate) &&
      base_currencies_equal?(exchange_rate) &&
      dates_equal?(exchange_rate)
  end

  private

  def dates_equal?(exchange_rate)
    date == exchange_rate.date
  end

  def base_currencies_equal?(exchange_rate)
    base_currency == exchange_rate.base_currency
  end

  def counter_currencies_equal?(exchange_rate)
    counter_currency == exchange_rate.counter_currency
  end
end
