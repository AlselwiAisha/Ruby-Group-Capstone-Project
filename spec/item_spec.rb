require 'date'
require './lib/item'

RSpec.describe Item do
  let(:publish_date) { '2010-01-01' } # Replace with a valid publish date
  let(:item) { Item.new(publish_date) }

  it 'has attributes id, publish_date, archived, genre, source, author, label' do
    expect(item.id).to be_a(Integer)
    expect(item.publish_date).to eq(publish_date)
    expect(item.archived).to be(false)
    expect(item.genre).to be_an(Array)
    expect(item.source).to be_an(Array)
    expect(item.author).to be_an(Array)
    expect(item.label).to be_an(Array)
  end

  it 'determines if it can be archived' do
    expect(item.can_be_archived?).to be(true) # Assuming the publish date is more than 10 years ago
  end

  it 'Does not move to archive if it cannot be archived' do
    item = Item.new('2022-01-01')
    expect(item.can_be_archived?).to be(false)
    item.move_to_archive
    expect(item.archived).to be(false)
  end
end
