# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  date        :datetime
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
end
