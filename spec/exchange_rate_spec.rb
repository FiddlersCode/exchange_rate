require 'exchange_rate'

RSpec.describe ExchangeRate do
  it 'has a version number' do
    expect(ExchangeRate::VERSION).to eq '0.1.0'
  end

  before(:each) do
    @exchange_rate = ExchangeRate.new(Date.today, 'USD', 'CHF')
  end

  describe 'instantiation' do
    it 'currency exchanger accepts from and to currencies' do
      expect(@exchange_rate.from_currency).to eq('USD')
      expect(@exchange_rate.to_currency).to eq('CHF')
    end

    it 'currency exchanger accepts a date' do
      expect(@exchange_rate.date).to eq(Date.today)
    end
  end

  describe 'get exchange rate' do
    it 'returns a new exchange rate object' do
      expect(@exchange_rate.get_exchange_rate).to eq(ExchangeRate.new(@exchange_rate.date, @exchange_rate.from_currency, @exchange_rate.to_currency,))
    end

    it 'returns a new exchange rate object with a new date object set to today\'s date' do
      @exchange_rate_object = @exchange_rate.get_exchange_rate
      expect(@exchange_rate_object.date).to eq Date.today
    end

    it 'returns a new exchange rate object with a new date object set to a past date' do
      exchange_rate = ExchangeRate.new( Date.new(2018-01-02), 'USD', 'USD')
      exchange_rate_object = exchange_rate.get_exchange_rate
      expect(exchange_rate_object.date).to eq Date.new(2018-01-02)
    end
  end

  describe 'invalid data' do
    it 'should throw an error if the date is not supported' do
      exchange_rate = ExchangeRate.new( Date.new(1900-01-02), 'USD', 'USD')
      allow(exchange_rate).to receive(:is_date_valid?) { false }
      expect{exchange_rate.get_exchange_rate}.to raise_error("Date must be within the past 90 days.")

    end
  end

end