require 'exchange_rate'

RSpec.describe ExchangeRate do
  before(:each) do
    @valid_date = valid_date
    @data_retriever = DataRetriever.new
    @exchange_rate = ExchangeRate.new(@valid_date, 'EUR', 'USD')
  end

  describe 'get exchange rate' do
    it 'get_exchange_rate returns a new exchange rate object' do
      @data_retriever.get_rates_file('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml', './spec/acceptance/')
      exchange_rate_object = @exchange_rate.get_exchange_rate
      expect(exchange_rate_object.date).to eq(@valid_date)
      expect(exchange_rate_object.rate).to be_a(Float)
    end
  end

private

  def valid_date
    if Date.today.saturday?
      return Date.today.prev_day
    elsif Date.today.sunday?
      return Date.today.prev_day.prev_day
    else
      return Date.today
    end
  end

end
