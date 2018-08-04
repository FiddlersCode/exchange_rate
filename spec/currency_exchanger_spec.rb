require 'currency_exchanger'

RSpec.describe CurrencyExchanger do
  it 'has a version number' do
    expect(CurrencyExchanger::VERSION).to eq '0.1.0'
  end

  before(:each) do
    @currency_exchanger = CurrencyExchanger.new('USD', 'CHF', Date.today)
  end

  describe 'instantiation' do
    it 'currency exchanger accepts from and to currencies' do
      expect(@currency_exchanger.from_currency).to eq('USD')
      expect(@currency_exchanger.to_currency).to eq('CHF')
    end

    it 'currency exchanger accepts a date' do
      expect(@currency_exchanger.date).to eq(Date.today)
    end
  end

  describe 'get exchange rate' do
    it 'returns a new exchange rate object' do
      expect(@currency_exchanger.get_exchange_rate).to eq(ExchangeRate.new(@currency_exchanger.from_currency, @currency_exchanger.to_currency, @currency_exchanger.date))
    end

    it 'returns a new exchange rate object with a new date object set to today\'s date' do
      @exchange_rate_object = @currency_exchanger.get_exchange_rate
      expect(@exchange_rate_object.date).to eq Date.today
    end

    it 'returns a new exchange rate object with a new date object set to a past date' do
      currency_exchanger = CurrencyExchanger.new('USD', 'USD', Date.new(2018-01-02))
      exchange_rate_object = currency_exchanger.get_exchange_rate
      expect(exchange_rate_object.date).to eq Date.new(2018-01-02)
    end
  end

end