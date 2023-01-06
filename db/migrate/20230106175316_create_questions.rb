class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :subject, null: false, foreign_key: { on_delete: :cascade }
      t.integer :answers_count, default: 0
      t.integer :votes_count, default: 0

      t.timestamps
    end
  end
end
