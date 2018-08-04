class ExchangeRate

  attr_reader :from_currency, :to_currency, :date
  def initialize(from_currency, to_currency, date)
    @from_currency = from_currency
    @to_currency = to_currency
    @date = date
  end

  def ==(exchange_rate)
    self.to_currency == exchange_rate.to_currency &&
        self.from_currency == exchange_rate.from_currency &&
        self.date == exchange_rate.date
  end

end