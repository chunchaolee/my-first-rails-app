class UpdateColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :tasks, :due_date, :date
  end
end
