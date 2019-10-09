class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.integer :score
      t.datetime :completed_at

    end
    add_reference :tests, :users, foreign_key: true

  end
end
