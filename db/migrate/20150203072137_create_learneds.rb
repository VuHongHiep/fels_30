class CreateLearneds < ActiveRecord::Migration
  def change
    create_table :learneds do |t|
      t.references :user, index: true
      t.references :word, index: true

      t.timestamps
    end
  end
end
