class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.boolean :admin, default: false, null: false
      t.index :email
      t.index :remember_token

      t.timestamps null: false
    end
  end
end
