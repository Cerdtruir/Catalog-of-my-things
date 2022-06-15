require_relative '../genre'
require_relative '../game'

describe Genre do
  genre = Genre.new('The genre')

  context 'when initializing' do
    it 'should set the name' do
      expect(genre.name).to eq('The genre')
    end
  end

  context 'when adding items' do
    game = Game.new('The title', Date.today, true, Date.today)
    genre.add_item(game)

    it 'should add the item to the items array' do
      expect(genre.items).to eq([game])
    end
    it 'should set the genre of the item' do
      expect(game.genre).to eq(genre)
    end
  end
end
