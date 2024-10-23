class CreateQuizzs < ActiveRecord::Migration[7.2]
  def change
    create_table :quizzs do |t|
      t.string :title

      t.timestamps
    end
  end
end
