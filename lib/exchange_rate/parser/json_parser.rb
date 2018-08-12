class JSONParser < Parser


  def get_rate(exchange_rate_object)
    raise 'Date must be within the past 90 days.' unless date_valid?(exchange_rate_object.date)
    raise "The base currency #{exchange_rate_object.base_currency} is not supported." unless base_currency_valid?(exchange_rate_object)
    raise "The counter currency #{exchange_rate_object.counter_currency} is not supported." unless counter_currency_valid?(exchange_rate_object)

  end

  def get_counter_currencies(exchange_rate_object)

  end

  def open_rates_file

  end

  def get_current_rates_file
    './lib/exchange_rate_data/daily_rates.xml'
  end
end