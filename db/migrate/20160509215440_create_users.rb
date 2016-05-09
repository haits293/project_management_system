class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :password_digest
      t.string :gender
      t.string :class
      t.string :institue

      t.timestamps null: false
    end
  end
end
