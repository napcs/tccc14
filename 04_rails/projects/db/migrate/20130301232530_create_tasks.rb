class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.integer :priority
      t.integer :project_id
      t.integer :difficulty

      t.timestamps
    end
  end
end
