class ExchangeRate

  attr_reader :date, :from_currency, :to_currency, :rate

  def initialize(date, from_currency, to_currency, rate = nil)
    @date = date
    @from_currency = from_currency
    @to_currency = to_currency
    @rate = rate
  end

  def get_exchange_rate
    raise "This currency is not supported." if !is_currency_valid?
    parser = XMLParser.new
    rate = parser.get_rate(self)
    ExchangeRate.new(@date, @from_currency, @to_currency, rate)
  end

  def ==(exchange_rate)
    self.to_currency == exchange_rate.to_currency &&
        self.from_currency == exchange_rate.from_currency &&
        self.date == exchange_rate.date
  end

  def is_currency_valid?
    true
  end

end