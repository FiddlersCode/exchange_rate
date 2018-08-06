require 'exchange_rate'

RSpec.describe ExchangeRate do

  describe 'file fetching' do

    before(:each) do
      @retriever = DataRetriever.new
    end

    it 'fetches the production xml and stores it locally' do
      url = 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml?526da90c43e51cc5b44bf360e6f1dac3'
      destination = './lib/rates/'
      @retriever.get_rates_file(url, destination)
      expect(File.exist?('./lib/rates/daily_rates.xml')).to be true
      end
    end

end