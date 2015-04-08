class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :db_user_id
      t.string :encrypted_db_access_token
      t.string :encrypted_db_access_token_salt
      t.string :encrypted_db_access_token_iv
    end
    add_index :users, :db_user_id, unique: true
  end
end
