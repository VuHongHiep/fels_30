class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :answer
      t.boolean :check
      t.references :word, index: true

      t.timestamps
    end
  end
end
