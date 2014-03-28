class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.string :poketype, null: false
      t.integer :number, null: false

      t.timestamps
    end

    add_index :pokemons, :number, unique: true
  end
end
