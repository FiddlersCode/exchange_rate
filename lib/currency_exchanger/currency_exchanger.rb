class CurrencyExchanger

  attr_reader :from_currency, :to_currency, :date

  def initialize(from_currency, to_currency, date)
    @from_currency = from_currency
    @to_currency = to_currency
    @date = date
  end

  def get_exchange_rate
    1
  end

end
