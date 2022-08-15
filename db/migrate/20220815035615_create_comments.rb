class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :owner
      t.integer :article_id
      t.string :message

      t.timestamps
    end
  end
end
