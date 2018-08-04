class XMLParser
  def initialize(file)
    @file = file
  end

  def get_rate(exchange_rate_object)
    doc = Nokogiri::XML(File.open(@file))
    format_xml(doc)
    date = exchange_rate_object.date
    currency = exchange_rate_object.to_currency
    doc.xpath("//Cube/Cube[@time='#{date}']/Cube[@currency='#{currency}']/@rate").to_s
  end

private
  def format_xml(file)
    file.remove_namespaces!
  end

end