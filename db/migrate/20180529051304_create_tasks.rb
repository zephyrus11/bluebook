class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, index: true, foreign_key: true
      t.string :task
      t.text :detail
      t.date :due_date
      t.boolean :completed, default: false

      t.timestamps
    end


  end
end
