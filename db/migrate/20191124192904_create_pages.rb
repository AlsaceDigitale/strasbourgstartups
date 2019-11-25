class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :code
      t.string :title
      t.string :slug

      t.timestamps
    end
    add_index :pages, :code, unique: true
  end
end
