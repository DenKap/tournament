class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer   :uid
      t.string    :provider
      t.string    :email
      t.string    :nick
      t.string    :token
      t.string    :refresh_token
      t.integer   :token_expires_at
      t.timestamps
    end

    add_index :users, :provider
    add_index :users, :uid
    add_index :users, :email, unique: true
    add_index :users, :nick, unique: true
  end
end
