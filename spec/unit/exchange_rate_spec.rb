require 'exchange_rate'

RSpec.describe ExchangeRate do
  it 'has a version number' do
    expect(ExchangeRate::VERSION).to eq '0.1.0'
  end

  before(:each) do
    @yesterday = Date.today.prev_day
    @exchange_rate = ExchangeRate.new(@yesterday, 'EUR', 'USD')
  end

  describe 'instantiation' do
    it 'currency exchanger accepts from and to currencies' do
      expect(@exchange_rate.from_currency).to eq('EUR')
      expect(@exchange_rate.to_currency).to eq('USD')
    end

    it 'currency exchanger accepts a date' do
      expect(@exchange_rate.date).to eq(@yesterday)
    end
  end

  describe 'get exchange rate' do
    it 'get_exchange_rate returns a new exchange rate object' do
      @exchange_rate = ExchangeRate.new(Date.new(2018,8,3), 'EUR', 'USD')
      exchange_rate_object = @exchange_rate.get_exchange_rate
      expect(exchange_rate_object.rate).to eq(1.1588)
    end

    it 'returns a new exchange rate object with a new date object set to today\'s date' do
      @exchange_rate = ExchangeRate.new(@yesterday, 'EUR', 'USD')
      @exchange_rate_object = @exchange_rate.get_exchange_rate
      expect(@exchange_rate_object.date).to eq @yesterday
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