class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :no_of_copies
      t.boolean :available

      t.timestamps
    end
  end
end
