class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.text :question
      t.integer :user_id
      t.integer :answer_type
      t.integer :category_id

      t.timestamps
    end
  end
end
