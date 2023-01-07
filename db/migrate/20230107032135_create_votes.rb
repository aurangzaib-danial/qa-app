class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.belongs_to :question, null: false, foreign_key: { on_delete: :cascade } 
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade } 

      t.timestamps
    end
    add_index :votes, [:question_id, :user_id], unique: true
  end
end
