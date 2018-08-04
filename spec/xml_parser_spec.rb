require 'exchange_rate'

RSpec.describe ExchangeRate do

  it 'fetches the document and stores it locally' do
    exchange_rate_xml = (open('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml?526da90c43e51cc5b44bf360e6f1dac3'))
    IO.copy_stream(exchange_rate_xml, "./lib/rates/daily_rates.xml")
    expect(File.exist?("./lib/rates/daily_rates.xml")).to be true
  end
end