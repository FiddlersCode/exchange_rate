class CurrencyExchanger

  attr_reader :from_currency, :to_currency, :date

  def initialize(from_currency, to_currency, date)
    @from_currency = from_currency
    @to_currency = to_currency
    @date = date
  end

  def get_exchange_rate
    ExchangeRate.new(@from_currency, @to_currency, @date)
  end

end
