class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
