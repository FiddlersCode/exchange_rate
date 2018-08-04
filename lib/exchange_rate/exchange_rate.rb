class ExchangeRate

  attr_reader :date, :from_currency, :to_currency

  def initialize(date, from_currency, to_currency)
    @date = date
    @from_currency = from_currency
    @to_currency = to_currency
  end

  def get_exchange_rate
    raise "Date must be within the past 90 days." if !is_date_valid?
    ExchangeRate.new(@date, @from_currency, @to_currency)
  end

  def ==(exchange_rate)
    self.to_currency == exchange_rate.to_currency &&
        self.from_currency == exchange_rate.from_currency &&
        self.date == exchange_rate.date
  end

  def is_date_valid?
    true
  end

end