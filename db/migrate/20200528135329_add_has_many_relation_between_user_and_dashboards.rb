class AddHasManyRelationBetweenUserAndDashboards < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :dashboards, :user, foreign_key: true
  end
end
