class JSONParser < Parser


  def get_rate(exchange_rate_object)
    raise 'Date must be within the past 90 days.' unless date_valid?(exchange_rate_object.date)
    raise "The base currency #{exchange_rate_object.base_currency} is not supported." unless base_currency_valid?(exchange_rate_object)
    raise "The counter currency #{exchange_rate_object.counter_currency} is not supported." unless counter_currency_valid?(exchange_rate_object)

    open_rates_file.xpath("//Cube/Cube[@time='#{exchange_rate_object.date}']/Cube[@currency='#{exchange_rate_object.counter_currency}']/@rate").to_s.to_f
  end

  def get_counter_currencies(exchange_rate_object)
    date_cubes = open_rates_file.xpath("//Cube/Cube[@time='#{exchange_rate_object.date}']/Cube")
    date_cubes.to_a.map { |e| e.to_a[0][1] }
  end

  def open_rates_file
    @file = get_current_rates_file
    doc = Nokogiri::XML(File.open(@file))
    format_xml(doc)
  end

  def format_xml(file)
    file.remove_namespaces!
  end


  def get_current_rates_file
    './lib/exchange_rate_data/daily_rates.xml'
  end
end