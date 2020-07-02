class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :fullname

      t.timestamps
    end
    add_index :users, :username
  end
end
