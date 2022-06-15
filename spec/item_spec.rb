require_relative '../item'
require_relative '../genre'

describe Item do
  item = Item.new('The title', Date.today)
  context 'when initializing' do
    it 'should set the title' do
      expect(item.title).to eq('The title')
    end

    it 'should set the publish date' do
      expect(item.publish_date).to eq(Date.today)
    end
  end
  context 'when adding a genre' do
    genre = Genre.new('The genre')
    item.genre = genre
    it 'should set the genre' do
      expect(item.genre).to eq(genre)
    end
    it 'should add the item to the genre' do
      expect(genre.items).to include(item)
    end
  end
  context 'when moving to archive' do
    it 'Dont set archived to true if less than 10 years old' do
      item.move_to_archive
      expect(item.archived).to be_falsey
    end
    it 'set archived to true if more than 10 years old' do
      item2 = Item.new('The title', Date.new(2000, 1, 1))
      item2.move_to_archive
      expect(item2.archived).to eq(true)
    end
  end
end
