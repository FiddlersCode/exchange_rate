require 'exchange_rate'

RSpec.describe ExchangeRate do
  it 'has a version number' do
    expect(ExchangeRate::VERSION).to eq '0.1.0'
  end

  before(:each) do
    @exchange_rate = ExchangeRate.new(Date.today, 'EUR', 'USD')
  end

  describe 'instantiation' do
    it 'currency exchanger accepts from and to currencies' do
      expect(@exchange_rate.from_currency).to eq('EUR')
      expect(@exchange_rate.to_currency).to eq('USD')
    end

    it 'currency exchanger accepts a date' do
      expect(@exchange_rate.date).to eq(Date.today)
    end
  end

  describe 'get exchange rate' do
    it 'get_exchange_rate returns a new exchange rate object' do
      @exchange_rate = ExchangeRate.new(Date.new(2018,8,3), 'EUR', 'USD')
      exchange_rate_object = @exchange_rate.get_exchange_rate
      expect(exchange_rate_object.rate).to eq(1.1588)
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

    it 'should throw an error if the from currency is not supported' do
      exchange_rate = ExchangeRate.new( Date.today, 'unsupported_currency', 'USD')
      allow(exchange_rate).to receive(:is_currency_valid?) { false }
      expect{exchange_rate.get_exchange_rate}.to raise_error("This currency is not supported.")
    end

    it 'should throw an error if the to currency is not supported' do
      exchange_rate = ExchangeRate.new( Date.today, 'USD', 'unsupported_currency')
      allow(exchange_rate).to receive(:is_currency_valid?) { false }
      expect{exchange_rate.get_exchange_rate}.to raise_error("This currency is not supported.")
    end

  end

  describe 'past dates' do
    it 'can find the rate for a past date' do
      @exchange_rate = ExchangeRate.new(Date.new(2018,8,1), 'EUR', 'USD')
      @exchange_rate_object = @exchange_rate.get_exchange_rate
      expect(@exchange_rate_object.rate).to eq(1.1696)
      expect(@exchange_rate_object.date).to eq(Date.new(2018,8,1))
    end

  end

end