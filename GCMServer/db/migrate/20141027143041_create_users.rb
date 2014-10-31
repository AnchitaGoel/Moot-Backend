class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :interests
      t.string :emailId
      t.string :password
      t.string :gcm_id
      t.timestamps
    end
  end
end
