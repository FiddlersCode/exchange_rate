class ExchangeRate

  attr_reader :date, :from_currency, :to_currency, :rate

  def initialize(date, from_currency, to_currency, rate = nil)
    @date = date
    @from_currency = from_currency
    @to_currency = to_currency
    @rate = rate
  end

  def get_exchange_rate
    raise "Date must be within the past 90 days." if !is_date_valid?
    raise "This currency is not supported." if !is_currency_valid?
    parser = XMLParser.new('./lib/rates/daily_rates.xml')
    rate = parser.get_rate(@date, @from_currency, @to_currency)
    ExchangeRate.new(@date, @from_currency, @to_currency, rate)
  end

  def ==(exchange_rate)
    self.to_currency == exchange_rate.to_currency &&
        self.from_currency == exchange_rate.from_currency &&
        self.date == exchange_rate.date
  end

  def is_date_valid?
    true
  end

  def is_currency_valid?
    true
  end

end