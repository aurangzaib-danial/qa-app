class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :title

      t.timestamps
    end
    add_index :subjects, :title, unique: true
  end
end
