class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
    add_reference :entries, :users, foreign_key: true
    
  end
end
