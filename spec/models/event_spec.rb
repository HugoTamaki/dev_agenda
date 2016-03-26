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

require "rails_helper"

describe Event do
  let(:address) { FactoryGirl.create(:address) }
  let(:event) { FactoryGirl.create(:event, address: address) }

  describe "Attributes" do
    it { expect(event).to have_attribute :name }
    it { expect(event).to have_attribute :date }
    it { expect(event).to have_attribute :description }
  end

  describe "Relationships" do
    it { expect(event).to respond_to :address }
  end
end
