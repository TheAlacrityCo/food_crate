class PlaceService
    def self.find_place(input, lat, lng, radius=8000)
        response = conn.get do |req|
            req.params['input'] = input
            req.params['inputtype'] = 'textquery'
            req.params['locationbias'] = "circle:#{radius}@#{lat},#{lng}"
            req.params['fields'] = "photos,formatted_address,name,opening_hours,rating"
        end
        JSON.parse(response.body, symbolize_names: true)[:candidates]
    end

    private
        
        def self.conn
            Faraday.new "https://maps.googleapis.com/maps/api/place/findplacefromtext/json" do |conn|
                conn.params['key'] = ENV['google_api_key']
            end
        end
end
