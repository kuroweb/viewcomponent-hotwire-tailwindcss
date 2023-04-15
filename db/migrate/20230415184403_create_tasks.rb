class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :summary
      t.date :due_date
      t.integer :priority, null: false, default: 0

      t.timestamps
    end
  end
end
