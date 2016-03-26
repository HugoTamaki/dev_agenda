require 'json'

class GeocodeApi
  include HTTParty
  base_uri "https://maps.googleapis.com/maps/api/geocode/"

  def self.get_coordinates(street)
    response = get("/json?address=#{street}&key=#{ENV['GEOCODE_API']}")
    result = JSON.parse response.body
    result['results'][0]['geometry']['location']
  end
end