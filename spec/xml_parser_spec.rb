require 'exchange_rate'

RSpec.describe ExchangeRate do

  describe 'file fetching', type: :feature do
    Capybara.current_driver = :selenium
    xit 'fetches the document and stores it locally' do
      exchange_rate_xml = (open('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml?526da90c43e51cc5b44bf360e6f1dac3'))
      IO.copy_stream(exchange_rate_xml, "./lib/rates/daily_rates.xml")
      expect(File.exist?("./lib/rates/daily_rates.xml")).to be true
    end

  end

  describe 'parsing the xml' do

    it 'should get the date of the first item in the row' do
      parser = XMLParser.new("./lib/rates/daily_rates.xml")
      expect(parser.get_rate('2018-08-03', 'USD')).to eq 1.1588
    end
  end

end