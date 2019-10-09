class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.boolean :completed?

    end
    add_reference :goals, :users, foreign_key: true

  end
end
