class XMLParser
  attr_reader :file

  def initialize
    @file
  end

  def get_rate(exchange_rate_object)
    raise "Date must be within the past 90 days." if !is_date_valid?(exchange_rate_object.date)
    raise "This base currency is not supported." if !is_base_currency_valid?(exchange_rate_object)
    raise "This counter currency is not supported." if !is_counter_currency_valid?(exchange_rate_object)

    @file = get_current_rates_file
    doc = Nokogiri::XML(File.open(@file))
    format_xml(doc)
    doc.xpath("//Cube/Cube[@time='#{exchange_rate_object.date}']/Cube[@currency='#{exchange_rate_object.to_currency}']/@rate").to_s.to_f
  end

  private

  def is_date_valid?(date)
    true if (Date.today - date).to_i < 90
  end

  def is_base_currency_valid?(exchange_rate_object)
    true if exchange_rate_object.from_currency == 'EUR'
  end

  def is_counter_currency_valid?(exchange_rate_object)
    true if get_counter_currencies(exchange_rate_object).include? exchange_rate_object.to_currency
  end

  def get_counter_currencies(exchange_rate_object)
    @file = get_current_rates_file
    doc = Nokogiri::XML(File.open(@file))
    format_xml(doc)
    cube = doc.xpath("//Cube/Cube[@time='#{exchange_rate_object.date}']/Cube")
    cube.to_a
    cube.map { |e| e.to_a[0][1]}
  end

  def format_xml(file)
    file.remove_namespaces!
  end

  def get_current_rates_file
    './lib/rates/daily_rates.xml'
  end

end