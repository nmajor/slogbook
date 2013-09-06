class ChangeMissionshipsStartEndDateColDatatype < ActiveRecord::Migration
  def up
    change_table :missionships do |t|
      t.change :start_date, :date
      t.change :end_date,   :date
    end
  end

  def down
    change_table :missionships do |t|
      t.change :start_date, :datetime
      t.change :end_date,   :datetime
    end
  end
end
