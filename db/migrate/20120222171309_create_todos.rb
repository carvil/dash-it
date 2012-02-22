class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :description
      t.string :status
      t.integer :project_id

      t.timestamps
    end
  end
end
