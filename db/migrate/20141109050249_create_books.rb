class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :no_of_copies, :default => 0
      t.boolean :available, :default => false

      t.timestamps
    end
  end
end
