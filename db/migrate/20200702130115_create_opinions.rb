class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.references :author, class: :user
      t.string :text

      t.timestamps
    end
  end
end
