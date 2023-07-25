class CreateRepositoryUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :repository_users do |t|
      t.references :user, foreign_key: true
      t.references :repository, foreign_key: true
      t.timestamps
    end

    add_index :repository_users, [:user_id, :repository_id], unique: true
  end
end
