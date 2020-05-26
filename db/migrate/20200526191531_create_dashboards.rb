class CreateDashboards < ActiveRecord::Migration[5.2]
  def change
    create_table :dashboards do |t|
      t.string :title, null: false
      t.text :content

      t.timestamps
    end
  end
end
