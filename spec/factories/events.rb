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


FactoryGirl.define do
  factory :event do
    name "Evento de ruby"
    user_id 1
    skill 1
    energy 1
    luck 1
    gold 1
  end

end
