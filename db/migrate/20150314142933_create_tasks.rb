class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description

      t.references :team, index: true

      t.timestamps null: false
    end
  end
end
