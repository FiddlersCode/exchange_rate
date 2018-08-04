class XMLParser
  def initialize(file)
    @file = file
  end

  def get_rate(date, from_currency, to_currency)
    doc = Nokogiri::XML(File.open(@file))
    format_xml(doc)
    doc.xpath("//Cube/Cube[@time='#{date}']/Cube[@currency='#{to_currency}']/@rate").to_s.to_f
  end

private
  def format_xml(file)
    file.remove_namespaces!
  end

end