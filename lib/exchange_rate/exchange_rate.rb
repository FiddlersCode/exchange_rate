class ExchangeRate

  attr_reader :date, :from_currency, :to_currency, :rate

  def initialize(date, from_currency, to_currency, rate = nil)
    @date = date
    @from_currency = from_currency
    @to_currency = to_currency
    @rate = rate
  end

  def get_exchange_rate
    parser = XMLParser.new
    rate = parser.get_rate(self)
    ExchangeRate.new(@date, @from_currency, @to_currency, rate)
  end

  def ==(exchange_rate)
    to_currencies_equal?(exchange_rate) &&
        from_currencies_equal?(exchange_rate) &&
        dates_equal?(exchange_rate)
  end

  private

  def dates_equal?(exchange_rate)
    self.date == exchange_rate.date
  end

  def from_currencies_equal?(exchange_rate)
    self.from_currency == exchange_rate.from_currency
  end

  def to_currencies_equal?(exchange_rate)
    self.to_currency == exchange_rate.to_currency
  end

end