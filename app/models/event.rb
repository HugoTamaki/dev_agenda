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
#  end_date    :datetime
#  url         :string
#

class Event < ActiveRecord::Base
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  before_create :set_end_date

  scope :by_month, -> (month) { where("extract(month from date) = ?", month) }

  private

    def set_end_date
      if self.end_date.nil?
        self.end_date = self.date
      end
    end
end
