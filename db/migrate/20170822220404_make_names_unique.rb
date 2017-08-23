class MakeNamesUnique < ActiveRecord::Migration[5.1]
  def change
    add_index :cats, :name, unique: true
  end
end
