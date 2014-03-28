require 'spec_helper'

feature "User views the pokedex", %q{
  As a User
  I want to view the pokedex
  So that I can see all the Pokemon

  Acceptance Criteria:
  - I want to see all the Pokemon
  - I should see each Pokemon's name, type, and number
  - Pokemon should be ordered by their National Pokedex number
} do
  scenario "User sees all the Pokemon" do
    pokemon1 = Pokemon.create!(name: 'Bulbasaur', poketype: 'Leaf', number: 1)
    pokemon2 = Pokemon.create!(name: 'Pikachu', poketype: 'Electric', number: 2)
    pokemon3 = Pokemon.create!(name: 'Charmander', poketype: 'Fire', number: 3)
    pokemons = [pokemon1, pokemon2, pokemon3]

    visit root_path

    pokemons.each do |pokemon|
      expect(page).to have_content pokemon.number
      expect(page).to have_content pokemon.name
      expect(page).to have_content pokemon.poketype
    end
  end
end
