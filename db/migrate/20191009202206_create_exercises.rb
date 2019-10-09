class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :content
    
    end
    add_reference :exercises, :users, foreign_key: true

  end
end
