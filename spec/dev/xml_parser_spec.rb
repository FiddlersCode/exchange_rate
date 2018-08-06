require 'exchange_rate'

RSpec.describe ExchangeRate do


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