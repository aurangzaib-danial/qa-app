class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :recipient, null: false, foreign_key: { to_table: :users, on_delete: :cascade }
      t.belongs_to :actor, null: false, foreign_key: { to_table: :users,  on_delete: :cascade }
      t.datetime :read_at
      t.string :action
      t.belongs_to :notifiable, polymorphic: true, null: false
      t.belongs_to :actionable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
