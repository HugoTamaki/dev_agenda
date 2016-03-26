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

require "rails_helper"

describe Address do
  let(:address) { FactoryGirl.create(:address) }
  let(:event) { FactoryGirl.create(:event, address: address) }

  describe "Attributes" do
    it { expect(address).to have_attribute :event_id }
    it { expect(address).to have_attribute :street }
    it { expect(address).to have_attribute :state }
    it { expect(address).to have_attribute :city }
    it { expect(address).to have_attribute :district }
    it { expect(address).to have_attribute :number }
    it { expect(address).to have_attribute :coordinates_x }
    it { expect(address).to have_attribute :coordinates_y }
  end

  describe "Relationships" do
    it { expect(address).to respond_to :event }
  end

  describe "Methods" do
    context "before creating" do
      let(:address) { FactoryGirl.build(:address) }

      it "gets coordinates" do
        address.save
        expect(address.coordinates_x).to eql("-22.901924")
        expect(address.coordinates_y).to eql("-43.1747912")
      end
    end
  end
end


