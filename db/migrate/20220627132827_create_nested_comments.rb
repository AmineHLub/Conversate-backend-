class CreateNestedComments < ActiveRecord::Migration[7.0]
  def change
    create_table :nested_comments do |t|
      t.text :text
      t.text :username
      t.references :user, null: false, foreign_key: true
      t.references :direct_comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
