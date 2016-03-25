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

class Address < ActiveRecord::Base
  belongs_to :event
end
