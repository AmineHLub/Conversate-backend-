class CreateDirectComments < ActiveRecord::Migration[7.0]
  def change
    create_table :direct_comments do |t|
      t.text :text
      t.references :user, null: false, foreign_key: true
      t.references :conversation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
