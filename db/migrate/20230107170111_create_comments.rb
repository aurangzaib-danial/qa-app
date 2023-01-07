class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :commentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
