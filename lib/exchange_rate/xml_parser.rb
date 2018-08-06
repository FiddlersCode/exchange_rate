class XMLParser
  attr_reader :file

  def initialize
    @file
  end

  def get_rate(date, to_currency)
    @file = get_current_rates_file
    doc = Nokogiri::XML(File.open(@file))
    format_xml(doc)
    doc.xpath("//Cube/Cube[@time='#{date}']/Cube[@currency='#{to_currency}']/@rate").to_s.to_f
  end

  private

  def get_current_rates_file
    './lib/rates/daily_rates.xml'
  end

  def format_xml(file)
    file.remove_namespaces!
  end

end