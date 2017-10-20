class UpdateDate < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :date
    add_column :tasks, :date, :date
  end
end
