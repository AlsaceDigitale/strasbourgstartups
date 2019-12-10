class CreateStartupUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :startup_users do |t|
      t.references :startup, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
