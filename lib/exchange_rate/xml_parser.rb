class XMLParser
  def initialize(file)
    @file = file
  end

  def get_rate(exchange_rate_object)
    doc = Nokogiri::XML(File.open(@file))
    self.format_xml(doc)
    doc.xpath('//Cube/Cube[@time="2018-08-03"]/Cube[@currency="USD"]/@rate').to_s
  end


  def format_xml(file)
    file.remove_namespaces!
  end

end