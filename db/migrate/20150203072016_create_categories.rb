class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :descript

      t.timestamps
    end
  end
end
