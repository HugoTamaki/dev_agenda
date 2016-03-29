class AddUrlAndEndDateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :end_date, :datetime
    add_column :events, :url, :string
  end
end
