require_relative '../game'
require_relative '../item'

describe Game do
  it 'Game should be a subclass of Item' do
    expect(Game.superclass).to eq(Item)
  end

  context 'when initializing' do
    game = Game.new('The title', Date.today, true, Date.today)

    it 'should set the title' do
      expect(game.title).to eq('The title')
    end

    it 'should set the publish date' do
      expect(game.publish_date).to eq(Date.today)
    end

    it 'should set the multiplayer' do
      expect(game.multiplayer).to eq(true)
    end
    it 'should set the last played at date' do
      expect(game.last_played_at_date).to eq(Date.today)
    end
  end
end
