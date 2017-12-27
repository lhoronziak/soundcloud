class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :encrypted_password, null: false, default: ""
      t.timestamps null: false
    end

    add_index :users, :username, unique: true
  end
end
