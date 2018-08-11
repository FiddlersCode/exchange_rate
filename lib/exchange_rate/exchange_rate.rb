class ExchangeRate
  attr_reader :date, :base_currency, :to_currency, :rate

  def initialize(date, base_currency, to_currency, rate = nil)
    @date = date
    @base_currency = base_currency
    @to_currency = to_currency
    @rate = rate
  end

  def get_exchange_rate
    parser = XMLParser.new
    rate = parser.get_rate(self)
    ExchangeRate.new(@date, @base_currency, @to_currency, rate)
  end

  def ==(exchange_rate)
    to_currencies_equal?(exchange_rate) &&
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

  def to_currencies_equal?(exchange_rate)
    to_currency == exchange_rate.to_currency
  end
end
