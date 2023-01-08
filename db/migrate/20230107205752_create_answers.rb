class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade}
      t.belongs_to :question, null: false, foreign_key: { on_delete: :cascade}

      t.timestamps
    end
  end
end
