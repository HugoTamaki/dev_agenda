# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  event_id      :integer
#  street        :string
#  state         :string
#  city          :string
#  district      :string
#  number        :string
#  coordinates_x :string
#  coordinates_y :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'geocode_api'

class Address < ActiveRecord::Base
  belongs_to :event
  before_create :get_address_coordinates

  private

  def get_address_coordinates
    coordinates = GeocodeApi.get_coordinates(formated_address)
    self.coordinates_x = coordinates['lat']
    self.coordinates_y = coordinates['lng']
  end

  def formated_address
    "#{street} #{number}, #{state}, #{city}"
  end
end
