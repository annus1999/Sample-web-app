class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.string :name, null: false
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
