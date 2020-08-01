class GeocodeService
  def self.get_coordinates(address)
    response = conn.get do |req|
      req.params['address'] = address
    end
    JSON.parse(response.body, symbolize_names: true)[:results].first[:geometry][:location]
  end

  def self.conn
    Faraday.new 'https://maps.googleapis.com/maps/api/geocode/json' do |conn|
      conn.params['key'] = ENV['google_api_key']
    end
  end
end
