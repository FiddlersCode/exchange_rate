require 'exchange_rate'

RSpec.describe ExchangeRate do

  describe 'file fetching', type: :feature do
    Capybara.current_driver = :selenium
    it 'fetches the document and stores it locally' do
      exchange_rate_xml = (open('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml?526da90c43e51cc5b44bf360e6f1dac3'))
      IO.copy_stream(exchange_rate_xml, "./spec/test_data/daily_rates.xml")
      expect(File.exist?("./spec/test_data/daily_rates.xml")).to be true
    end

  end

  describe 'parsing the xml' do
    before(:each) do
      @parser = XMLParserDev.new
    end

    it 'should get set the xml file' do
      @parser.get_rate('2018-08-03', 'USD')
      expect(@parser.file).to eq './spec/test_data/daily_rates.xml'
    end
  end

end