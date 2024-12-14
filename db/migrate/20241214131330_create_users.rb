class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.integer :comments_count
      t.integer :likes_count
      t.boolean :private

      t.timestamps
    end
  end
end
