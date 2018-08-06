class DataRetriever

  def get_rates_file(url, destination)
    file = (open(url))
    IO.copy_stream(file, "./#{destination}/daily_rates.xml")
  end
end