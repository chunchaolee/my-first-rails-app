class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      #建立task table
      t.string :name
      t.integer :due_date
      t.text :note
      t.timestamps
    end
  end
end
