require 'spec_helper'

describe Pokemon do
  describe "validations" do
    it "requires a name" do
      pokemon = Pokemon.new
      pokemon.valid?

      expect(pokemon.errors[:name]).to include "can't be blank"
    end

    describe "#number" do
      it "requires a number" do
        pokemon = Pokemon.new
        pokemon.valid?

        expect(pokemon.errors[:number]).to include "can't be blank"
      end

      it "is unique" do
        pokemon = Pokemon.create(name: 'Jakeichu', poketype: 'Chappy', number: 1)
        dupe = Pokemon.new(number: 1)
        dupe.valid?

        expect(dupe.errors[:number]).to include "has already been taken"
      end 
    end

    it "requires a poketype" do
      pokemon = Pokemon.new
      pokemon.valid?

      expect(pokemon.errors[:poketype]).to include "can't be blank"
    end
  end
end
