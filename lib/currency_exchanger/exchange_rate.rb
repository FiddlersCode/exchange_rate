class ExchangeRate < CurrencyExchanger

  def ==(exchange_rate)
    self.to_currency == exchange_rate.to_currency &&
        self.from_currency == exchange_rate.from_currency &&
        self.date == exchange_rate.date
  end

end