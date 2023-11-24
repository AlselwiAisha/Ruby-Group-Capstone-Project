require_relative '../lib/author'
require './lib/item'
require 'json'

RSpec.describe Author do
  let(:author) { Author.new('John', 'Doe') }

  it 'has an ID, first name, last name, and items array' do
    expect(author.id).to be_a(Integer)
    expect(author.first_name).to eq('John')
    expect(author.last_name).to eq('Doe')
    expect(author.items).to be_an(Array)
  end

  it 'Adds an item to the author' do
    item = Item.new('2022-01-01')

    author.add_item(item)

    expect(author.items).to include(item)
    expect(item.author).to eq(author)
  end
  it 'generates JSON representation' do
    json_data = author.to_json

    expect(json_data).to include('"first_name":"John"')
    expect(json_data).to include('"last_name":"Doe"')
  end
end
