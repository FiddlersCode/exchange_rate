class CurrencyExchanger

  attr_reader :date, :from_currency, :to_currency

  def initialize(date, from_currency, to_currency)
    @date = date
    @from_currency = from_currency
    @to_currency = to_currency
  end

  def get_exchange_rate
    ExchangeRate.new(@date, @from_currency, @to_currency)
  end

end
