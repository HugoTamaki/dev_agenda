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

FactoryGirl.define do
  factory :address do
    event_id 1
    street "Travessa do Ouvidor"
    state "RJ"
    city "Niteroi"
    district "Centro"
    number "17"
    coordinates_x "9999999"
    coordinates_y "9999999"
  end
end
