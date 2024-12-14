class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # t.string :email,              null: false, default: "" # Already exists
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:users, :encrypted_password)

      ## Recoverable
      t.string   :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)

      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)

      ## Additional columns
      t.string  :username unless column_exists?(:users, :username)
      t.integer :comments_count, default: 0 unless column_exists?(:users, :comments_count)
      t.integer :likes_count, default: 0 unless column_exists?(:users, :likes_count)
      t.boolean :private, default: false unless column_exists?(:users, :private)

      # Uncomment the following if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    # Adding indexes
    add_index :users, :email,                unique: true unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    add_index :users, :username,             unique: true unless index_exists?(:users, :username)
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end

