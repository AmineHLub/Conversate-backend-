class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :img, :null => false, :default => 'hey'

      t.timestamps
    end
  end
end
