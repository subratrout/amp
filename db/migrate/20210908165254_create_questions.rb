class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :body
      t.boolean :answer
      t.references :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
