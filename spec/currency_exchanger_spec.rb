require 'currency_exchanger'
RSpec.describe CurrencyExchanger do
  it "has a version number" do
    expect(CurrencyExchanger::VERSION).to eq '0.1.0'
  end

  it "can get exchange rate" do
    currency_exchanger = CurrencyExchanger.new
    expect(currency_exchanger.get_exchange_rate).to eq(1)
  end
end
