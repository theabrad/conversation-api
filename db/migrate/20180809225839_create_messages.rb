class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :conversation, foreign_key: true, index: true
      t.text :body

      t.timestamps
    end
  end
end
