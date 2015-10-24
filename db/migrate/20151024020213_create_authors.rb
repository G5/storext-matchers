class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.text :data
    end
  end
end
