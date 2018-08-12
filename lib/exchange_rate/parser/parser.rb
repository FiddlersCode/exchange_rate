class Parser
  attr_reader :file

  def initialize
    @file
  end

  private

  def date_valid?(date)
    true if (Date.today - date).to_i < 90
  end

  def base_currency_valid?(exchange_rate_object)
    true if exchange_rate_object.base_currency == 'EUR'
  end

  def counter_currency_valid?(exchange_rate_object)
    true if get_counter_currencies(exchange_rate_object).include? exchange_rate_object.counter_currency
  end

end
