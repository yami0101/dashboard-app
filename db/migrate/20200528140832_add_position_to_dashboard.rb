class AddPositionToDashboard < ActiveRecord::Migration[5.2]
  def change
    add_column :dashboards, :position, :integer
  end
end
