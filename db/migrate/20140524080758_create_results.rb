class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :survey_id
      t.integer :answer_id
      t.text :another_content
      t.string :answer_email

      t.timestamps
    end
  end
end
