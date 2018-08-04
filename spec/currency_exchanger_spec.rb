require 'currency_exchanger'
RSpec.describe CurrencyExchanger do
  it "has a version number" do
    expect(CurrencyExchanger::VERSION).to eq '0.1.0'
  end

  it "can get exchange rate" do
    currency_exchanger = CurrencyExchanger.new("USD", "USD", "today")
    expect(currency_exchanger.get_exchange_rate).to eq(1)
  end

  it "currency exchanger accepts a from currency" do
    currency_exchanger = CurrencyExchanger.new("USD", "CHF", "today")
    expect(currency_exchanger.from_currency).to eq("USD")
  end

  it "currency exchanger accepts a to currency" do
    currency_exchanger = CurrencyExchanger.new("USD", "CHF", "today")
    expect(currency_exchanger.to_currency).to eq("CHF")
  end

  it "currency exchanger accepts a date" do
    currency_exchanger = CurrencyExchanger.new("USD", "CHF", "today")
    expect(currency_exchanger.date).to eq("today")
  end
end
