class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :summary
      t.date :due_date, null: false
      t.string :priority, null: false, default: "low"

      t.timestamps
    end
  end
end
