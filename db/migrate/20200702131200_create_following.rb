class CreateFollowing < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :follower, class: :user
      t.references :followed, class: :user
    end
  end
end
