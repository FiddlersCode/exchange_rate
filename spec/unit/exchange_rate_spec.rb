require 'exchange_rate'

RSpec.describe ExchangeRate do
  it 'has a version number' do
    expect(ExchangeRate::VERSION).to eq '0.1.0'
  end

  before(:each) do
    @valid_date = Date.new(2018,8,3)
    @exchange_rate = ExchangeRate.new(@valid_date, 'EUR', 'USD')
  end

  describe 'instantiation' do
    it 'currency exchanger accepts from and to currencies' do
      expect(@exchange_rate.base_currency).to eq('EUR')
      expect(@exchange_rate.counter_currency).to eq('USD')
    end

    it 'currency exchanger accepts a date' do
      expect(@exchange_rate.date).to eq(@valid_date)
    end
  end

  describe 'get exchange rate' do
    it 'get_exchange_rate returns a new exchange rate object' do
      exchange_rate_object = ExchangeRate.at(@valid_date, 'EUR', 'USD')
      expect(exchange_rate_object.date).to eq(@valid_date)
      expect(exchange_rate_object.rate).to eq(1.1588)
    end
  end

end
